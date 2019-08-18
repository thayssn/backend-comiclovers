require('dotenv').config();

module.exports = {
  dialect: 'postgres',
  host: 'db',
  username: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  // logging: true,
  define: {
    timestamp: true,
    underscored: true,
    underscoredAll: true,
    charset: 'utf8',
    collate: 'utf8_general_ci',
  },
};
