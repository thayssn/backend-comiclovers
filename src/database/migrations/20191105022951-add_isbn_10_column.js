module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('books', 'isbn_10', {
      type: Sequelize.STRING,
      unique: true,
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('books', 'isbn_10');
  },
};
