module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('books', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      isbn: {
        type: Sequelize.STRING,
        allowNull: false,
        unique: true,
      },
      title: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      edition: {
        type: Sequelize.STRING,
      },
      pages: {
        type: Sequelize.INTEGER,
      },
      description: {
        type: Sequelize.TEXT(),
      },
      publishing_date: {
        type: Sequelize.DATE,
      },
      format: {
        type: Sequelize.STRING,
      },
      price: {
        type: Sequelize.STRING,
      },
      thumbnail: {
        type: Sequelize.STRING,
      },
      total_rating: {
        type: Sequelize.INTEGER,
      },
      total_favorites: {
        type: Sequelize.INTEGER,
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false,
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: false,
      },
    });
  },

  down: queryInterface => {
    return queryInterface.dropTable('books');
  },
};
