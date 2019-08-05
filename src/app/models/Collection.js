import Sequelize, { Model } from 'sequelize';

class Collection extends Model {
  static init(sequelize) {
    super.init(
      {
        title: {
          type: Sequelize.STRING,
          allowNull: false,
        },
        description: {
          type: Sequelize.TEXT('long'),
        },
        thumbnail: {
          type: Sequelize.STRING,
        },
      },
      {
        sequelize,
      }
    );
    return this;
  }

  static associate(models) {
    Collection.belongsToMany(models.Book, {
      through: 'collection_books',
      as: 'books',
    });
  }
}

export default Collection;
