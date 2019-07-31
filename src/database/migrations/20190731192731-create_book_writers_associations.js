module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface
      .addColumn(
        'book_writers', // name of Target model
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
          'book_writers', // name of Target model
          'writer_id', // name of the key we're adding
          {
            type: Sequelize.INTEGER,
            references: {
              model: 'writers', // name of Source model
              key: 'id',
            },
            onUpdate: 'CASCADE',
            onDelete: 'SET NULL',
          }
        );
      });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('book_writers', 'book_id').then(() => {
      queryInterface.removeColumn('book_writers', 'writer_id');
    });
  },
};
