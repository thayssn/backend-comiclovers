import Sequelize, { Model } from 'sequelize';

class Writer extends Model {
  static init(sequelize) {
    super.init(
      {
        name: Sequelize.STRING,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    Writer.belongsToMany(models.Book, { through: 'book_writers' });
  }
}

export default Writer;
