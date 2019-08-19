import express from 'express';
import morgan from 'morgan';
import path from 'path';
import cors from 'cors';
import routes from './routes';
import './database';

class App {
  constructor() {
    this.server = express();
    this.middlewares();
    this.routes();
  }

  middlewares() {
    this.server.use(cors());
    this.server.use(
      morgan(':method :url :status :res[content-length] - :response-time ms')
    );
    this.server.use(
      '/static/covers',
      express.static(path.join(__dirname, '..', 'media', 'book_covers'))
    );
    this.server.use(express.json());
  }

  routes() {
    this.server.use(routes);
  }
}

export default new App().server;
