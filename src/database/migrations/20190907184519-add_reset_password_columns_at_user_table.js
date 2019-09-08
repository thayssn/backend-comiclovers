module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface
      .addColumn('users', 'password_reset_token', {
        type: Sequelize.STRING,
      })
      .then(() => {
        return queryInterface.addColumn(
          'users',
          'password_reset_token_expires',
          {
            type: Sequelize.DATE,
          }
        );
      });
  },

  down: queryInterface => {
    return queryInterface
      .removeColumn('users', 'password_reset_token')
      .then(() => {
        queryInterface.removeColumn('users', 'password_reset_token_expires');
      });
  },
};
