import { Router } from 'express';
import UserController from './app/controllers/UserController';
import AuthController from './app/controllers/AuthController';
import IllustratorController from './app/controllers/IllustratorController';
import PublisherController from './app/controllers/PublisherController';
import WriterController from './app/controllers/WriterController';
import LicensorController from './app/controllers/LicensorController';
import BookController from './app/controllers/BookController';
import BulkInsertController from './app/controllers/BulkInsertController';
import authMiddleware from './app/middlewares/auth';
import uploadMiddleware from './app/middlewares/upload';

const routes = new Router();
const API_BASE_URL = '/api';

/* PUBLISHERS ROUTES */
routes.post(`${API_BASE_URL}/publishers`, PublisherController.store);
routes.get(`${API_BASE_URL}/publishers`, PublisherController.list);
routes.get(`${API_BASE_URL}/publishers/:id`, PublisherController.show);
routes.put(`${API_BASE_URL}/publishers/:id`, PublisherController.update);
routes.delete(`${API_BASE_URL}/publishers/:id`, PublisherController.remove);

/* WRITERS ROUTES */
routes.post(`${API_BASE_URL}/writers`, WriterController.store);
routes.get(`${API_BASE_URL}/writers`, WriterController.list);
routes.get(`${API_BASE_URL}/writers/:id`, WriterController.show);
routes.put(`${API_BASE_URL}/writers/:id`, WriterController.update);
routes.delete(`${API_BASE_URL}/writers/:id`, WriterController.remove);

/* LICENSORS ROUTES */
routes.post(`${API_BASE_URL}/licensors`, LicensorController.store);
routes.get(`${API_BASE_URL}/licensors`, LicensorController.list);
routes.get(`${API_BASE_URL}/licensors/:id`, LicensorController.show);
routes.put(`${API_BASE_URL}/licensors/:id`, LicensorController.update);
routes.delete(`${API_BASE_URL}/licensors/:id`, LicensorController.remove);

/* ILLUSTRATOR ROUTES */
routes.post(`${API_BASE_URL}/illustrators`, IllustratorController.store);
routes.get(`${API_BASE_URL}/illustrators`, IllustratorController.list);
routes.get(`${API_BASE_URL}/illustrators/:id`, IllustratorController.show);
routes.put(`${API_BASE_URL}/illustrators/:id`, IllustratorController.update);
routes.delete(`${API_BASE_URL}/illustrators/:id`, IllustratorController.remove);

/* BOOKS ROUTES */
routes.post(
  `${API_BASE_URL}/books`,
  uploadMiddleware('book_covers', 'image'),
  BookController.store
);
routes.get(`${API_BASE_URL}/books`, BookController.list);
routes.get(`${API_BASE_URL}/books/:id`, BookController.show);
routes.put(`${API_BASE_URL}/books/:id`, BookController.update);
routes.delete(`${API_BASE_URL}/books/:id`, BookController.remove);

routes.post(`${API_BASE_URL}/books/bulk`, BulkInsertController.bulkStore);

/* USER ROUTES */
routes.post(
  `${API_BASE_URL}/users`,
  uploadMiddleware('profile_pics', 'image'),
  UserController.store
);
routes.post(`${API_BASE_URL}/auth`, AuthController.store);
routes.use(authMiddleware);
routes.get(`${API_BASE_URL}/me/`, UserController.show);
routes.put(`${API_BASE_URL}/users`, UserController.update);
routes.delete(`${API_BASE_URL}/users`, UserController.remove);
routes.get(`${API_BASE_URL}/users`, UserController.list);

module.exports = routes;
