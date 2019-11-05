module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface
      .addColumn('users', 'refresh_token', {
        type: Sequelize.STRING,
      })
      .then(() => {
        return queryInterface.addColumn('users', 'refresh_token_expires', {
          type: Sequelize.DATE,
        });
      });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('users', 'refresh_token').then(() => {
      queryInterface.removeColumn('users', 'refresh_token_expires');
    });
  },
};
