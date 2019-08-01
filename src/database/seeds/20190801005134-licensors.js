module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'licensors',
      [
        {
          id: 1,
          name: 'DC Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 2,
          name: 'Shueisha',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 3,
          name: 'DC (Vertigo)',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 4,
          name: 'Art Spiegelman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 5,
          name: 'Marvel Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 6,
          name: 'Shogakukan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 7,
          name: 'Marvel Comics (Icon)',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 8,
          name: 'Mauricio de Sousa',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 9,
          name: 'DCComics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 10,
          name: 'Avatar Press',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 11,
          name: 'Kodansha',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 12,
          name: 'Dargaud',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 13,
          name: 'Image Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 14,
          name: 'Dc Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
      ],
      {}
    );
  },

  down: queryInterface => {
    return queryInterface.bulkDelete('licensors', null, {});
  },
};
