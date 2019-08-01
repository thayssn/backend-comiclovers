module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'writers',
      [
        {
          id: 1,
          name: 'Frank Miller',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 2,
          name: 'Eiichiro Oda',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 3,
          name: 'Neil Gaiman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 4,
          name: 'Alan Moore',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 5,
          name: 'Mike W. Barr',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 6,
          name: 'Art Spiegelman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 7,
          name: 'Mark Millar',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 8,
          name: 'Brian Azzarello',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 9,
          name: 'Grant Morrison',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 10,
          name: 'Garth Ennis',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 11,
          name: 'Scott Snyder',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 12,
          name: 'Chris Claremont',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 13,
          name: 'Naoki Urasawa',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 14,
          name: 'Brian Michael Bendis',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 15,
          name: 'Geoff Johns',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 16,
          name: 'David Mack',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 17,
          name: 'Jason Aaron',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 18,
          name: 'Lee Bermejo',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 19,
          name: 'Stan Lee',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 20,
          name: 'Vitor Cafaggi',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 21,
          name: 'Luciana Cafaggi',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 22,
          name: 'Greg Rucka',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 23,
          name: 'Ed Brubaker',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 24,
          name: 'Katsuhiro Otomo',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 25,
          name: 'Masamune Shirow',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 26,
          name: 'Pierre Christin - \u2018Linus\u2019',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 27,
          name: 'Peter Milligan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 28,
          name: 'Mark Waid',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 29,
          name: 'Brian K. Vaughan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 30,
          name: 'Jim Krueger',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          id: 31,
          name: 'Fabiano Denardin',
          created_at: new Date(),
          updated_at: new Date(),
        },
      ],
      {}
    );
  },

  down: queryInterface => {
    return queryInterface.bulkDelete('writers', null, {});
  },
};
