import Sequelize from 'sequelize';
import databaseConfig from '../config/database';
import User from '../app/models/User';
import Illustrator from '../app/models/Illustrator';
import Writer from '../app/models/Writer';
import Licensor from '../app/models/Licensor';
import Publisher from '../app/models/Publisher';
import Book from '../app/models/Book';
import Collection from '../app/models/Collection';

const models = [
  User,
  Illustrator,
  Writer,
  Licensor,
  Publisher,
  Book,
  Collection,
];
class Database {
  constructor() {
    this.init();
  }

  init() {
    this.connection = new Sequelize(databaseConfig);
    models
      .map(model => model.init(this.connection))
      .map(model => model.associate && model.associate(this.connection.models));
  }
}

export default new Database();
