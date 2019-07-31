import Sequelize, { Model } from 'sequelize';

class Publisher extends Model {
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
    Publisher.belongsToMany(models.Book, { through: 'book_publishers' });
  }
}

export default Publisher;
