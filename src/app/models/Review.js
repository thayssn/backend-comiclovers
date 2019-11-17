import Sequelize, { Model } from 'sequelize';

class Review extends Model {
  static init(sequelize) {
    super.init(
      {
        rating: Sequelize.INTEGER,
        favorite: {
          type: Sequelize.BOOLEAN,
          defaultValue: false,
        },
        has_book: {
          type: Sequelize.BOOLEAN,
          defaultValue: false,
        },
        comment: Sequelize.TEXT('long'),
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
