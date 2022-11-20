db = db.getSiblingDB( 'optica' );
db.dropDatabase();
db = db.getSiblingDB( 'optica' );

db.createCollection( 'proveidors' );
db.createCollection( 'clients' );

db.proveidors.insertMany(
  [
    {
      _id: 1,
      nom: 'Proveidor 1',
      telefon: '123456789',
      email: 'proveidor1@proveidor.com',
      NIF: 'A58375890',
      adreça: {
        carrer: 'Carrer de la Proveiduria 1',
        ciutat: 'Barcelona',
        codi_postal: 08032,
        pais: 'Espanya'
      }
    },
    {
      _id: 2,
      nom: 'Proveidor 2',
      telefon: '123456789',
      email: 'proveidor2@proveidor.com',
      NIF: 'B58375890',
      adreça: {
        carrer: 'Carrer de la Proveiduria 2',
        ciutat: 'Badalona',
        codi_postal: 08032,
        pais: 'Espanya'
      }
    },
    {
      _id: 3,
      nom: 'Proveidor 3',
      telefon: '123456789',
      email: 'proveidor3@proveidor.com',
      NIF: 'C58375890',
      adreça: {
        carrer: 'Carrer de la Proveiduria 3',
        ciutat: 'Barcelona',
        codi_postal: 08032,
        pais: 'Espanya'
      }
    }
  ]

);

db.proveidors.find().pretty();

db.clients.insertMany(
  [
    {
      _id: 1,
      nom: 'Client 1',
      adreça_postal: '08010',
      telefon: '123456789',
      correu_electronic: 'client1@client1.com',
      data_registre: '2022-09-12',
      ulleres:
      {
        marca: 'Ray-Ban',
        graduacio_esquerra: 1.5,
        graduacio_dreta: 1.5,
        muntura: {
          ENUM: [ 'pasta', 'metàl·lica' ],
          default: 'pasta'
        },
        color_muntura: 'marro_caca',
        preu: 100,
        proveidor: {
          $ref: 'Proveidors',
          $_id: 1
        },
        empleat: {
          cod_emp: 1,
          nom: 'Empleat 1',
        }
      }
    },
    {
      _id: 2,
      nom: 'Client 2',
      adreça_postal: '08010',
      telefon: '123456789',
      correu_electronic: 'client2@client2.com',
      data_registre: '2022-09-12',
      client_recomanat: {
        $ref: 'clients',
        $_id: 1
      },
      ulleres:
      {
        marca: 'Carolina Herrera',
        graduacio_esquerra: 1.5,
        graduacio_dreta: 1.5,
        muntura: {
          ENUM: [ 'pasta', 'metàl·lica' ],
          default: 'metàl·lica'
        },
        color_muntura: 'color elf',
        preu: 400,
        proveidor: {
          $ref: 'Proveidors',
          $_id: 2
        },
        empleat: {
          cod_emp: 2,
          name: 'Empleat 2',
        }
      }
    }
  ]
);

db.clients.find().pretty();
