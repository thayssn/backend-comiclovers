import nodemailer from 'nodemailer';
import dotenv from 'dotenv';
import hbs from 'nodemailer-express-handlebars';
import path from 'path';

dotenv.config();

const transport = nodemailer.createTransport({
  host: process.env.SMTP_HOST,
  port: process.env.SMTP_PORT,
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASSWORD,
  },
});

transport.use(
  'compile',
  hbs({
    viewEngine: {
      extName: '.html',
      partialsDir: path.resolve('./src/modules/mailer/templates'),
      layoutsDir: path.resolve('./src/modules/mailer/templates'),
      defaultLayout: 'default.html',
    },
    viewPath: path.resolve('./src/modules/mailer/templates'),
    extName: '.html',
  })
);
export default transport;
