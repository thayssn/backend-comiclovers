module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'publishers',
      [
        {
          name: 'Panini',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Cia. das Letras',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'SESI-SP',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Devir',
          created_at: new Date(),
          updated_at: new Date(),
        },
      ],
      {}
    );
  },

  down: queryInterface => {
    return queryInterface.bulkDelete('publishers', null, {});
  },
};
