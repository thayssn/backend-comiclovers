module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.changeColumn('books', 'isbn', {
      type: Sequelize.STRING,
      allowNull: true,
      unique: true,
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.changeColumn('books', 'isbn', {
      type: Sequelize.STRING,
      allowNull: false,
      unique: true,
    });
  },
};
