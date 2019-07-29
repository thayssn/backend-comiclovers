import * as Yup from 'yup';
import path from 'path';
import fs from 'fs';
import sharp from 'sharp';
import User from '../models/User';

class UserController {
  async store(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string().required(),
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string()
        .required()
        .min(5),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation failed' });
    }

    console.log(req.body);

    try {
      const userExists = await User.findOne({
        where: { email: req.body.email },
      });
      if (userExists) {
        fs.unlinkSync(req.file.path);
        return res.status(400).json({ error: 'User already exists' });
      }

      const user = await User.create(req.body);

      user.profile_picture = `${user.id}.png`;

      await sharp(req.file.path)
        .resize(200)
        .jpeg({ quality: 70 })
        .toFile(path.resolve(req.file.destination, user.profile_picture));

      fs.unlinkSync(req.file.path);

      user.save();

      return res.status(201).json({
        id: user.id,
        name: user.name,
        email: user.email,
      });
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'An error ocurred during the register' });
    }
  }

  async update(req, res) {
    const schema = Yup.object().shape({
      name: Yup.string(),
      email: Yup.string().email(),
      oldPassword: Yup.string().min(5),
      password: Yup.string()
        .min(5)
        .when('oldPassword', (oldPassword, field) =>
          oldPassword ? field.required() : field
        ),
      confirmPassword: Yup.string().when('password', (password, field) =>
        password ? field.required().oneOf([Yup.ref('password')]) : field
      ),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation failed' });
    }

    const { email, oldPassword } = req.body;

    const user = await User.findByPk(req.userId);

    if (email !== user.email) {
      const userExists = await User.findOne({
        where: { email: req.body.email },
      });

      if (userExists) {
        return res.status(400).json({ error: 'User already exists' });
      }
    }

    if (oldPassword && !(await user.verifyPassword(oldPassword))) {
      return res.status(401).json({ error: 'Password does not match' });
    }

    const { id, name } = await user.update(req.body);

    return res.status(200).json({
      id,
      name,
      email,
    });
  }

  async show(req, res) {
    const { id } = req.params;

    try {
      const { name, email } = await User.findByPk(id);
      return res.status(200).json({ name, email });
    } catch (err) {
      return res.status(404).json({ error: 'User not found' });
    }
  }

  async remove(req, res) {
    try {
      const user = await User.findByPk(req.userId);
      await User.destroy({ where: { id: user.id } });
      return res.status(200).json({ success: 'User deleted' });
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new UserController();
