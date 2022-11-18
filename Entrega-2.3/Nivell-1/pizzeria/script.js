db = db.getSiblingDB( 'pizzeria' );
db.dropDatabase();
db = db.getSiblingDB( 'pizzeria' );

db.createCollection( 'clients' );
db.createCollection( 'botigues' );
db.createCollection( 'productes' );

db.clients.insertMany(
  [
    {
      _id: 1,
      nom: 'Client 1',
      cognoms: 'Cognom Client 1',
      email: 'client1@client1.com',
      adreça: {
        carrer: 'Carrer del Client 1',
        pis: 1,
        numero: 345,
        porta: 1,
        codi_postal: 08820,
        localitat: 'El Prat de Llobregat',
        provincia: 'Barcelona'
      }
    },
    {
      _id: 2,
      nom: 'Client 2',
      cognoms: 'Cognom Client 2',
      email: 'client2@client2.com',
      adreça: {
        carrer: 'Carrer de la Mare de Déu dels Àngels',
        numero: 12,
        pis: 3,
        porta: 2,
        codi_postal: 08002,
        localitat: 'Hospitalet de Llobregat',
        provincia: 'Barcelona'
      }
    }
  ]
);

db.clients.find().pretty();

db.botigues.insertMany(
  [
    {
      _id: 1,
      adreça: {
        carrer: 'Carrer de la Botiga 1 ',
        numero: 1,
        pis: 1,
        porta: 1,
        codi_postal: 08820,
        localitat: 'Barcelona',
        provincia: 'Barcelona'
      },
      empleats: [ {
        _id: 1,
        nom: 'Empleat 1',
        cognoms: 'Cognom Empleat 1',
        NIF: '12345678A',
        telefon: 123456789,
        tipus_de_feina: 'Repartidor'
      },
      {
        _id: 2,
        nom: 'Empleat 2',
        cognoms: 'Cognom Empleat 2',
        NIF: '12345678B',
        telefon: 123456789,
        tipus_de_feina: 'Cuiner'
      } ],
      comandes: [
        {
          _id: 1,
          data_hora: new Date( '2020-12-01T12:00:00' ),
          tipus: {
            ENUM: [ 'domicili', 'botiga' ],
            default: 'botiga',
          },
          productes: [ {
            producte_id: {
              $ref: 'productes',
              $_id: 3
            },
            quantitat: 2,
            preu: 24.5
          },
          {
            producte_id: {
              $ref: 'productes',
              $_id: 8
            },
            quantitat: 2,
            preu: 1.5
          },
          {
            producte_id: {
              ref: 'productes',
              $_id: 9
            },
            quantitat: 1,
            preu: 2
          } ]
        }
      ]

    },
    {
      _id: 2,
      adreça: {
        carrer: 'Carrer de la Botiga 2',
        numero: 28,
        pis: 0,
        porta: 0,
        codi_postal: 08054,
        localitat: 'Badalona',
        provincia: 'Barcelona'
      },
      empleats: [ {
        _id: 1,
        nom: 'Empleat 1',
        cognoms: 'De la Botiga 2',
        NIF: '12345678C',
        telefon: 123456789,
        lloc_de_treball: 'Repartidor'
      },
      {
        _id: 2,
        nom: 'Empleat 2',
        cognoms: 'De la Botiga 2',
        NIF: '12345678D',
        telefon: 123456789,
        lloc_de_treball: 'Cuiner'
      } ],
      comandes: [
        {
          _id: 1,
          data_hora: new Date( '2020-12-01T12:00:00' ),
          tipus: {
            ENUM: [ 'domicili', 'botiga' ],
            default: 'botiga',
          },
          productes: [ {
            producte_id: 5,
            quantitat: 1,
            preu: 9.99
          },
          {
            producte_id: 7,
            quantitat: 1,
            preu: 1.5
          } ]
        }
      ]
    }
  ]
);

db.botigues.find().pretty();

db.productes.insertMany(
  [
    {
      _id: 1,
      nom: 'Margarita',
      tipus: 'Pizza',
      descripcio: 'Pizza amb tomàquet, mozzarella i orégano',
      imatge: 'https://www.pizzahut.es/sites/default/files/styles/recipe_image/public/recipe_images/pizza-margarita.jpg?itok=Z8Y8QZ7Q',
      preu: 9.90
    },
    {
      _id: 2,
      nom: 'Carbonara',
      tipus: 'Pizza',
      descripcio: 'Pizza amb tomàquet, mozzarella, bacon, ou i orégano',
      imatge: 'https://www.pizzahut.es/sites/default/files/styles/recipe_image/public/recipe_images/pizza-carbonara.jpg?itok=Z8Y8QZ7Q',
      preu: 14.90
    },
    {
      _id: 3,
      nom: 'Napolitana',
      tipus: 'Pizza',
      descripcio: 'Pizza amb tomàquet, mozzarella, pernil, ceba i orégano',
      imatge: 'https://www.pizzahut.es/sites/default/files/styles/recipe_image/public/recipe_images/pizza-napolitana.jpg?itok=Z8Y8QZ7Q',
      preu: 11
    },
    {
      _id: 4,
      nom: 'More Than Happy Meal',
      tipus: 'Hamburguesa',
      descripcio: ' Hamburguesa amb formatge, bacon, ceba, tomàquet, lletuga, salsa BBQ i patates fregides',
      imatge: 'https://www.pizzahut.es/sites/default/files/styles/recipe_image/public/recipe_images/pizza-napolitana.jpg?itok=Z8Y8QZ7Q',
      preu: 10.90
    },
    {
      _id: 5,
      nom: 'Big King',
      tipus: 'Hamburguesa',
      descripcio: 'Hamburguesa amb formatge, bacon, ceba, tomàquet, lletuga, salsa BBQ i patates fregides. Els republicans mai la demanen',
      imatge: 'https://www.pizzahut.es/sites/default/files/styles/recipe_image/public/recipe_images/pizza-napolitana.jpg?itok=Z8Y8QZ7Q',
      preu: 12.90
    },
    {
      _id: 6,
      nom: 'Cangreburger',
      tipus: 'Hamburguesa',
      descripcio: 'Hamburguesa amb formatge, bacon, ceba, tomàquet, lletuga, salsa BBQ i patates fregides. La hamburguesa més cara del món',
      imatge: 'https://www.pizzahut.es/sites/default/files/styles/recipe_image/public/recipe_images/pizza-napolitana.jpg?itok=Z8Y8QZ7Q',
      preu: 20.90
    },
    {
      _id: 7,
      nom: 'Aigua mineral',
      tipus: 'Beguda',
      descripcio: 'Aigua amb minerals, què més vols?',
      imatge: 'https://www.iberdrola.com/iberdrola/energia/energia-sostenible/energia-sostenible-energia-renovable/energia-renovable-agua-mineral.jpg',
      preu: 1.5
    },
    {
      _id: 8,
      nom: 'Coca-Cola',
      tipus: 'Beguda',
      descripcio: 'La beguda del somriure capitalista',
      imatge: 'https://www.cocacola.es/content/dam/journey/es/es/private/brands/coca-cola/coca-cola-bottle.png',
      preu: 2
    },
    {
      _id: 9,
      nom: 'Voll-Damm',
      tipus: 'Beguda',
      descripcio: 'ampolla de cervesa Voll-Damm de 330 mil·lilitres',
      imatge: 'https://www.cervezaymas.com/1180-large_default/voll-damm.jpg',
      preu: 2.5
    },
  ]
);

db.productes.find().pretty();
