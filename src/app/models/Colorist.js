import Sequelize, { Model } from 'sequelize';

class Colorist extends Model {
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
    Colorist.belongsToMany(models.Book, {
      through: 'book_colorists',
    });
  }
}

export default Colorist;
