module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface
      .addColumn('reviews', 'comment', {
        type: Sequelize.TEXT(),
      })
      .then(() => {
        return queryInterface.addColumn('reviews', 'favorite', {
          type: Sequelize.BOOLEAN,
        });
      })
      .then(() => {
        return queryInterface.addColumn('reviews', 'has_book', {
          type: Sequelize.BOOLEAN,
        });
      });
  },

  down: queryInterface => {
    return queryInterface
      .removeColumn('reviews', 'comment')
      .then(() => {
        queryInterface.removeColumn('reviews', 'favorite');
      })
      .then(() => {
        queryInterface.removeColumn('reviews', 'has_book');
      });
  },
};
