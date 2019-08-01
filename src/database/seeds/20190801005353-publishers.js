module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'publishers',
      [
        {
          id: 1,
          name: 'Panini',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 2,
          name: 'Cia. das Letras',
          created_at: new Date(),
          updated_at: new Date(),
        },
        { id: 3, name: 'JBC', created_at: new Date(), updated_at: new Date() },
        {
          id: 4,
          name: 'SESI-SP',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 5,
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
