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

    const userEmail = req.body.email.toLowerCase();

    try {
      const userExists = await User.findOne({
        where: { email: userEmail },
      });
      if (userExists) {
        if (req.file) {
          fs.unlinkSync(req.file.path);
        }
        return res.status(400).json({ error: 'User already exists' });
      }

      const user = await User.create({ ...req.body, email: userEmail });

      if (req.file) {
        user.profile_picture = `static/users/${user.id}.png`;
        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${user.id}.png`));

        fs.unlinkSync(req.file.path);
        user.save();
      }

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

    try {
      const { email, oldPassword } = req.body;
      const newEmail = email.toLowerCase();

      const user = await User.findByPk(req.userId);

      if (req.file) {
        user.profile_picture = `static/users/${user.id}.png`;
        await sharp(req.file.path)
          .resize(200)
          .jpeg({ quality: 70 })
          .toFile(path.resolve(req.file.destination, `${user.id}.png`));

        fs.unlinkSync(req.file.path);
        user.save();
      }

      if (newEmail !== user.email) {
        const userExists = await User.findOne({
          where: { email: newEmail },
        });

        if (userExists) {
          return res.status(400).json({ error: 'User already exists' });
        }
      }

      if (oldPassword && !(await user.verifyPassword(oldPassword))) {
        return res.status(401).json({ error: 'Password does not match' });
      }

      await user.update({ ...req.body, email: newEmail });

      return res.status(200).json({
        success: true,
      });
    } catch (err) {
      return res.status(400).json({ error: 'Error trying to update user' });
    }
  }

  async show(req, res) {
    try {
      const { name, profile_picture, email } = await User.findByPk(req.userId);
      return res.status(200).json({ name, email, profile_picture });
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

  async list(req, res) {
    try {
      const currentPage = req.query.page;
      const currentLimit = req.query.limit;
      const limit = parseInt(currentLimit, 0) || null;
      const offset = limit * (parseInt(currentPage, 0) || 0);
      let users = await User.findAll({
        limit,
        offset,
      });
      users = users.map(user => ({
        id: user.id,
        name: user.name,
        email: user.email,
        profile_picture: user.profile_picture,
      }));
      return res.status(200).json(users);
    } catch (err) {
      return res.status(400).json({ error: 'An error occurred' });
    }
  }
}

export default new UserController();
