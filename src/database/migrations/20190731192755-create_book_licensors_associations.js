module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface
      .addColumn(
        'book_licensors', // name of Target model
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
          'book_licensors', // name of Target model
          'licensor_id', // name of the key we're adding
          {
            type: Sequelize.INTEGER,
            references: {
              model: 'licensors', // name of Source model
              key: 'id',
            },
            onUpdate: 'CASCADE',
            onDelete: 'SET NULL',
          }
        );
      });
  },

  down: queryInterface => {
    return queryInterface.removeColumn('book_licensors', 'book_id').then(() => {
      queryInterface.removeColumn('book_licensors', 'licensor_id');
    });
  },
};
