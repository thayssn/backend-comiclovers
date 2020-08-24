module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('books', 'type', {
      type: Sequelize.ENUM,
      values: ['Quadrinho', 'Mangá', 'Livro'],
      defaultValue: 'Quadrinho',
    });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('books', 'type');
  },
};
