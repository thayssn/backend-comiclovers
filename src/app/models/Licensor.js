import Sequelize, { Model } from 'sequelize';

class Licensor extends Model {
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
    Licensor.belongsToMany(models.Book, { through: 'book_licensors' });
  }
}

export default Licensor;
