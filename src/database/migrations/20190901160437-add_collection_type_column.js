module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn(
      'collections', // name of Target model
      'type', // name of the key we're adding
      {
        type: Sequelize.STRING,
      }
    );
  },

  down: queryInterface => {
    return queryInterface.removeColumn('collections', 'type');
  },
};
