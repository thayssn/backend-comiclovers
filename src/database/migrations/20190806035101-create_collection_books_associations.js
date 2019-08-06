module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface
      .addColumn(
        'collection_books', // name of Target model
        'book_id', // name of the key we're adding
        {
          type: Sequelize.INTEGER,
          references: {
            model: 'books', // name of Source model
            key: 'id',
          },
          onUpdate: 'CASCADE',
          onDelete: 'SET NULL',
        }
      )
      .then(() => {
        return queryInterface.addColumn(
          'collection_books', // name of Target model
          'collection_id', // name of the key we're adding
          {
            type: Sequelize.INTEGER,
            references: {
              model: 'collections', // name of Source model
              key: 'id',
            },
            onUpdate: 'CASCADE',
            onDelete: 'SET NULL',
          }
        );
      });
  },

  down: queryInterface => {
    return queryInterface
      .removeColumn('collection_books', 'book_id')
      .then(() => {
        queryInterface.removeColumn('collection_books', 'collection_id');
      });
  },
};
