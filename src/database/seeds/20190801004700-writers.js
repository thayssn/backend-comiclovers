module.exports = {
  up: queryInterface => {
    return queryInterface.bulkInsert(
      'writers',
      [
        {
          name: 'Frank Miller',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Eiichiro Oda',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Neil Gaiman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Alan Moore',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Mike W. Barr',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Art Spiegelman',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Mark Millar',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Brian Azzarello',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Grant Morrison',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Garth Ennis',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Scott Snyder',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Chris Claremont',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Naoki Urasawa',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Brian Michael Bendis',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Geoff Johns',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'David Mack',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Jason Aaron',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Lee Bermejo',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Stan Lee',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Vitor Cafaggi',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Luciana Cafaggi',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Greg Rucka',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Ed Brubaker',
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
          name: 'Pierre Christin - \u2018Linus\u2019',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Peter Milligan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Mark Waid',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Brian K. Vaughan',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
          name: 'Jim Krueger',
          created_at: new Date(),
          updated_at: new Date(),
        },
        {
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
