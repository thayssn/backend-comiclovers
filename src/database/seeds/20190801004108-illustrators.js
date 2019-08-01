module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'illustrators',
      [
        {
          name: 'David Mazzucchelli',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Eiichiro Oda',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Sam Kieth',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'David Lloyd',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Brian Bolland',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Jerry Bingham',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'George P\u00e9rez',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Curt Swan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Art Spiegelman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Dan Day',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Andy Kubert',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Steve McNiven',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'John Totleben',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Klaus Janson',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Lee Bermejo',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Frank Quitely',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'tephen Bissette - \u2018Steve\u2019',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Steve Dillon',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Frank Miller',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Greg Capullo',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Ron Randall',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Stan Woch',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Brent Anderson',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Elza Keiko',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Alex Maleev',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Ivan Reis',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Gary Frank',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'John Romita Jr.',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Jean Giraud - \u2018Moebius\u2019',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Vitor Cafaggi',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Michael Lark',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Jacen Burrows',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Katsuhiro Otomo',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Masamune Shirow',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Jean-Claude M\u00e9zi\u00e8res',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: "Gabriele Dell' Otto",
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Dave Gibbons',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Alex Ross',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Pia Guerra',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Fiona Staples',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'John Paul Leon',
          created_at: new Date(),
          updated_at: new Date(),
        },
      ],
      {}
    );
  },

  down: queryInterface => {
    return queryInterface.bulkDelete('illustrators', null, {});
  },
};
