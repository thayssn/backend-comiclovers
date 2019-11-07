import { Router } from 'express';
import UserController from './app/controllers/UserController';
import AuthController from './app/controllers/AuthController';
import IllustratorController from './app/controllers/IllustratorController';
import ColoristController from './app/controllers/ColoristController';
import PublisherController from './app/controllers/PublisherController';
import WriterController from './app/controllers/WriterController';
import LicensorController from './app/controllers/LicensorController';
import BookController from './app/controllers/BookController';
import BulkInsertController from './app/controllers/BulkInsertController';
import UserCollectionController from './app/controllers/UserCollectionController';
import CollectionBooksController from './app/controllers/CollectionBooksController';

import authMiddleware from './app/middlewares/auth';
import uploadMiddleware from './app/middlewares/upload';
import ReviewController from './app/controllers/ReviewController';

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

/* COLORIST ROUTES */
routes.post(`${API_BASE_URL}/colorists`, ColoristController.store);
routes.get(`${API_BASE_URL}/colorists`, ColoristController.list);
routes.get(`${API_BASE_URL}/colorists/:id`, ColoristController.show);
routes.put(`${API_BASE_URL}/colorists/:id`, ColoristController.update);
routes.delete(`${API_BASE_URL}/colorists/:id`, ColoristController.remove);

/* BOOKS ROUTES */
routes.post(
  `${API_BASE_URL}/books`,
  uploadMiddleware('book_covers', 'image'),
  BookController.store
);
routes.get(`${API_BASE_URL}/books/`, BookController.list);
routes.get(`${API_BASE_URL}/books/:id`, BookController.show);
routes.get(`${API_BASE_URL}/books/isbn/:isbn`, BookController.findByISBN);
routes.put(
  `${API_BASE_URL}/books/:id`,
  uploadMiddleware('book_covers', 'image'),
  BookController.update
);
routes.delete(`${API_BASE_URL}/books/:id`, BookController.remove);
routes.post(`${API_BASE_URL}/books/bulk`, BulkInsertController.bulkStore);
routes.get(`${API_BASE_URL}/update_covers`, BookController.batchUpdateCover);

/* AUTHENTICATION */
routes.post(`${API_BASE_URL}/auth`, AuthController.authenticate);
routes.post(`${API_BASE_URL}/fb_auth`, AuthController.authenticateWithFB);
routes.post(`${API_BASE_URL}/forgot_password`, AuthController.forgotPassword);
routes.post(`${API_BASE_URL}/reset_password`, AuthController.resetPassword);

/* USER ROUTES */
routes.post(
  `${API_BASE_URL}/users`,
  uploadMiddleware('profile_pics', 'image'),
  UserController.store
);
routes.use(authMiddleware);
routes.get(`${API_BASE_URL}/users`, UserController.list);
routes.get(`${API_BASE_URL}/me/`, UserController.show);
routes.put(
  `${API_BASE_URL}/me`,
  uploadMiddleware('profile_pics', 'image'),
  UserController.update
);
routes.delete(`${API_BASE_URL}/me`, UserController.remove);

/* PUBLIC COLLECTION */
routes.get(
  `${API_BASE_URL}/public/collections/`,
  UserCollectionController.listPublic
);
routes.get(
  `${API_BASE_URL}/public/collections/:id`,
  UserCollectionController.showPublic
);
routes.put(
  `${API_BASE_URL}/public/collections/:id`,
  uploadMiddleware('collection_covers', 'image'),
  UserCollectionController.updatePublic
);
routes.delete(
  `${API_BASE_URL}/public/collections/:id`,
  UserCollectionController.removePublic
);

/* USER COLLECTION */
routes.post(
  `${API_BASE_URL}/collections/`,
  uploadMiddleware('collection_covers', 'image'),
  UserCollectionController.store
);
routes.get(`${API_BASE_URL}/collections/`, UserCollectionController.list);
routes.get(`${API_BASE_URL}/collections/:id`, UserCollectionController.show);
routes.put(
  `${API_BASE_URL}/collections/:id`,
  uploadMiddleware('collection_covers', 'image'),
  UserCollectionController.update
);
routes.delete(
  `${API_BASE_URL}/collections/:id`,
  UserCollectionController.remove
);

/* COLLECTION BOOKS */
routes.post(
  `${API_BASE_URL}/collections/:id/books`,
  CollectionBooksController.store
);
routes.delete(
  `${API_BASE_URL}/collections/:id/books/:bookId`,
  CollectionBooksController.remove
);

/*  REVIEWS */
routes.get(`${API_BASE_URL}/books/:id/review`, ReviewController.show);
routes.post(`${API_BASE_URL}/books/:id/review`, ReviewController.store);

module.exports = routes;
