db = db.getSiblingDB( 'spotify' );
db.dropDatabase();
db = db.getSiblingDB( 'spotify' );

db.createCollection( 'usuaris' );
db.createCollection( 'playlists' );
db.createCollection( 'artistes' );

db.usuaris.insertMany(
  [
    {
      _id: 1,
      email: 'usuario1@usuario.com',
      password: 'usuario1password',
      username: 'usuario1',
      data_naixement: '1992-09-23',
      sexe: 'home',
      pais: 'espanya',
      codi_postal: 08820,
      tipus: 'premium',
      pagament: {
        _id: 1,
        targeta: {
          numero: '1234567890123456',
          caducitat: '06/25',
          cvv: 563
        },
        data: new Date( '2020-06-01' ),
        ordre: 3456346,
        total: 9.99
      }
    },
    {
      _id: 2,
      email: 'usuario2@usuario2.com',
      password: 'usuario2password2',
      username: 'usuario2',
      data_naixement: '1992-09-23',
      sexe: 'dona trans',
      pais: 'espanya',
      codi_postal: 08820,
      tipus: 'premium',
      pagament: {
        _id: 2,
        paypal: {
          usuari: 'usuari2@usuari2.com'
        },
        data: new Date( '2022-01-01' ),
        ordre: '1235',
        total: 9.99
      }
    },
    {
      _id: 3,
      email: 'usuari3@usuari3.com',
      password: '12345678',
      username: 'usuario3',
      data_naixement: '1992-09-23',
      sexe: 'home',
      pais: 'espanya',
      codi_postal: 08044,
      tipus: 'free'
    },
    {
      _id: 4,
      email: 'usuario4@usuario4.com',
      password: '12345678',
      username: 'usuario4',
      data_naixement: '1992-09-23',
      sexe: 'home',
      pais: 'espanya',
      codi_postal: 08614,
      tipus: 'free'
    }
  ]
);

db.usuaris.find().pretty();

db.artistes.insertMany(
  [
    {
      _id: 1,
      nom: 'Elton John',
      imatge: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Elton_John_2013.jpg/220px-Elton_John_2013.jpg',
      artista_relacionat: {
        $ref: 'artistes',
        $_id: 2
      },
      albums: [
        {
          _id: 1,
          titol: 'Songs ',
          any_publicacio: 2001,
          portada: 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/Songs_album_cover.jpg/220px-Songs_album_cover.jpg',
          likes: [
            {
              $ref: 'usuaris',
              $_id: 1
            },
            {
              $ref: 'usuaris',
              $_id: 2
            }
          ],
          cançons: [
            {
              _id: 1,
              titol: 'I Want Love',
              durada: '3:45',
              reproduccions: 567567,
              album: {
                $ref: 'albums',
                $_id: 1
              },
              likes: [
                {
                  $ref: 'usuaris',
                  $_id: 1
                },
                {
                  $ref: 'usuaris',
                  $_id: 2
                }
              ]
            },
            {
              _id: 2,
              titol: 'I Need You To Turn To',
              durada: '3:45',
              reproduccions: 567567,
              album: {
                $ref: 'albums',
                $_id: 1
              },
              likes: [
                {
                  $ref: 'usuaris',
                  $_id: 1
                },
                {
                  $ref: 'usuaris',
                  $_id: 2
                }
              ]
            }
          ]
        }
      ]
    },
    {
      _id: 2,
      nom: 'Black Sabbath',
      imatge: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Black-Sabbath.jpg',
      artista_relacionat: {
        $ref: 'artistes',
        $_id: 1
      },
      albums: [
        {
          _id: 1,
          titol: 'Paranoid',
          any_publicacio: 1970,
          portada: 'https://upload.wikimedia.org/wikipedia/en/thumb/5/5e/Songs_album_cover.jpg/220px-Songs_album_cover.jpg',
          likes: [
            {
              $ref: 'usuaris',
              $_id: 1
            },
            {
              $ref: 'usuaris',
              $_id: 2
            }
          ],
          cançons: [
            {
              _id: 3,
              titol: 'War Pigs',
              durada: '3:45',
              reproduccions: 567567,
              album: {
                $ref: 'albums',
                $_id: 1
              },
              likes: [
                {
                  $ref: 'usuaris',
                  $_id: 1
                },
                {
                  $ref: 'usuaris',
                  $_id: 2
                }
              ]
            },
            {
              _id: 4,
              titol: 'Hand of Doom',
              durada: '3:45',
              reproduccions: 567567,
              album: {
                $ref: 'albums',
                $_id: 1
              },
              likes: [
                {
                  $ref: 'usuaris',
                  $_id: 1
                },
                {
                  $ref: 'usuaris',
                  $_id: 2
                }
              ]
            }
          ]
        }
      ]
    }
  ]
);

db.artistes.find().pretty();

db.playlists.insertMany(
  [
    {
      _id: 1,
      titol: 'Energia pels matins!',
      camçons: [
        {
          canço: {
            $ref: 'cançons',
            $_id: 1
          },
          usuari: {
            $ref: 'usuaris',
            $_id: 1
          }
        },
        {
          canço: {
            $ref: 'cançons',
            $_id: 4
          },
          usuari: {
            $ref: 'usuaris',
            $_id: 2
          }
        }
      ],
      data_creacio: new Date( '2021-01-01' ),
      tipus: 'activa',
      usuari_creador: {
        $ref: 'usuaris',
        $_id: 1
      }
    }
  ]
);


db.playlists.find().pretty();
