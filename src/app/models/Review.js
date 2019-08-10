import Sequelize, { Model } from 'sequelize';

class Review extends Model {
  static init(sequelize) {
    super.init(
      {
        rating: Sequelize.INTEGER,
      },
      {
        sequelize,
      }
    );

    return this;
  }

  static associate(models) {
    this.belongsTo(models.Book);
    this.belongsTo(models.User);
  }
}

export default Review;
