import Sequelize, { Model } from 'sequelize';

class Book extends Model {
  static init(sequelize) {
    super.init(
      {
        isbn: {
          type: Sequelize.STRING,
          allowNull: false,
          unique: true,
        },
        title: {
          type: Sequelize.STRING,
          allowNull: false,
        },
        edition: {
          type: Sequelize.STRING,
        },
        pages: {
          type: Sequelize.INTEGER,
        },
        description: {
          type: Sequelize.TEXT('long'),
        },
        publishing_date: {
          type: Sequelize.DATE,
        },
        format: {
          type: Sequelize.STRING,
        },
        price: {
          type: Sequelize.STRING,
        },
        thumbnail: {
          type: Sequelize.STRING,
        },
        total_rating: {
          type: Sequelize.INTEGER,
        },
        total_favorites: {
          type: Sequelize.INTEGER,
        },
      },
      {
        sequelize,
      }
    );
    return this;
  }

  static associate(models) {
    Book.belongsToMany(models.Illustrator, {
      through: 'book_illustrators',
      as: 'illustrators',
    });
    Book.belongsToMany(models.Writer, {
      through: 'book_writers',
      as: 'writers',
    });
    Book.belongsToMany(models.Licensor, {
      through: 'book_licensors',
      as: 'licensors',
    });
    Book.belongsToMany(models.Publisher, {
      through: 'book_publishers',
      as: 'publishers',
    });
  }
}

export default Book;
