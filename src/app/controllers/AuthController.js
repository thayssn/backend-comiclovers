import jwt from 'jsonwebtoken';
import * as Yup from 'yup';
import crypto from 'crypto';
import User from '../models/User';
import authConfig from '../../config/auth';
import mailer from '../../modules/mailer';

class AuthController {
  async authenticate(req, res) {
    const schema = Yup.object().shape({
      email: Yup.string()
        .email()
        .required(),
      password: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation failed' });
    }

    const { email, password } = req.body;

    try {
      const user = await User.findOne({ where: { email } });

      if (!user) {
        return res.status(404).json({ error: 'User not found' });
      }

      if (!(await user.verifyPassword(password))) {
        return res.status(401).json({ error: 'Password does not match' });
      }

      const { id, name } = user;

      return res.status(200).json({
        user: {
          id,
          name,
          email,
        },
        token: jwt.sign({ id }, authConfig.secret, {
          expiresIn: authConfig.expiresIn,
        }),
      });
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'An error ocurred during authentication' });
    }
  }

  async forgotPassword(req, res) {
    const schema = Yup.object().shape({
      email: Yup.string()
        .email()
        .required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation failed' });
    }

    const { email } = req.body;

    try {
      const user = await User.findOne({ where: { email } });

      if (!user) {
        return res.status(404).json({ error: 'User not found' });
      }

      const token = crypto.randomBytes(20).toString('hex');
      const token_expires = new Date();
      token_expires.setHours(token_expires.getHours() + 1);

      await user.update({
        password_reset_token: token,
        password_reset_token_expires: token_expires,
      });

      return mailer.sendMail(
        {
          to: email,
          from: 'Comic Lovers <admin@comiclovers.com.br>',
          subject: 'Redefinição de senha',
          template: 'default',
          context: {
            subject: `Esqueceu sua senha?`,
            content: `
            <p>Olá, ${user.name}.</p>
            <p>Se você solicitou a redefinição da sua senha, utilize o link abaixo, que irá expirar em 1 hora: </p>
            <a href="http://painel.comiclovers.com.br/reset_password?email=${email}&token=${token}
            ">http://painel.comiclovers.com.br/reset_password?email=${email}&token=${token}</a>
            <p>Caso contrário, ignore este e-mail.</p>
            `,
          },
        },
        err => {
          if (err) {
            console.log(err);
            return res.status(400).json({ error: 'Could not send email' });
          }
          return res.status(200).json({ success: true });
        }
      );
    } catch (err) {
      return res
        .status(400)
        .json({ error: 'An error ocurred at forgot password' });
    }
  }

  async resetPassword(req, res) {
    const schema = Yup.object().shape({
      email: Yup.string()
        .email()
        .required(),
      token: Yup.string().required(),
      password: Yup.string().required(),
    });

    if (!(await schema.isValid(req.body))) {
      return res.status(400).json({ error: 'Validation failed' });
    }

    const { email, token, password } = req.body;

    try {
      const user = await User.findOne({ where: { email } });

      if (!user) {
        return res.status(404).json({ error: 'User not found' });
      }

      if (token !== user.password_reset_token) {
        return res.status(401).json({ error: 'Invalid token' });
      }

      const now = new Date();

      if (now > user.password_reset_token_expires) {
        return res.status(401).json({ error: 'Token expired' });
      }

      user.password = password;
      user.password_reset_token_expires = new Date();

      await user.save();

      return res.status(200).json({ success: true });
    } catch (err) {
      return res.status(400).json({ error: 'Cannot reset password' });
    }
  }
}

export default new AuthController();
