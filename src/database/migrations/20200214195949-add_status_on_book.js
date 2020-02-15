module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('books', 'status', {
      type: Sequelize.ENUM,
      values: ['Pendente', 'Aprovado', 'Desaprovado'],
      defaultValue: 'Pendente',
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('books', 'status');
  },
};
