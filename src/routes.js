import { Router } from 'express';
import UserController from './app/controllers/UserController';
import AuthController from './app/controllers/AuthController';

import authMiddleware from './app/middlewares/auth';
import uploadMiddleware from './app/middlewares/upload';

const routes = new Router();
const API_BASE_URL = '/api';

routes.post(
  `${API_BASE_URL}/users`,
  uploadMiddleware('profile_pics', 'image'),
  UserController.store
);
routes.post(`${API_BASE_URL}/auth`, AuthController.store);
routes.get(`${API_BASE_URL}/users/:id`, UserController.show);

routes.use(authMiddleware);
routes.put(`${API_BASE_URL}/users`, UserController.update);
routes.delete(`${API_BASE_URL}/users`, UserController.remove);

module.exports = routes;
