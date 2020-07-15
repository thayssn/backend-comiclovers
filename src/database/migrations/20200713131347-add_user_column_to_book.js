module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('books', 'user_id', {
      type: Sequelize.INTEGER,
      references: {
        model: 'users', // name of Source model
        key: 'id',
      },
      onUpdate: 'CASCADE',
      onDelete: 'SET NULL',
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('books', 'user_id');
  },
};
