module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'licensors',
      [
        {
          name: 'DC Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Shueisha',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'DC (Vertigo)',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Art Spiegelman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Marvel Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Shogakukan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Marvel Comics (Icon)',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Mauricio de Sousa',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'DCComics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Avatar Press',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Kodansha',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Dargaud',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Image Comics',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
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
