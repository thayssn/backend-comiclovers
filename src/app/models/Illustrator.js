import Sequelize, { Model } from 'sequelize';

class Illustrator extends Model {
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
    Illustrator.belongsToMany(models.Book, {
      through: 'book_illustrators',
    });
  }
}

export default Illustrator;
