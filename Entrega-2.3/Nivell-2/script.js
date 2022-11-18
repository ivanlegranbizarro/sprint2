db = db.getSiblingDB( 'youtube' );
db.dropDatabase();
db = db.getSiblingDB( 'youtube' );

db.createCollection( 'usuaris' );

db.usuaris.insertMany(
  [
    {
      _id: 1,
      email: 'usuari1@usuari1.com',
      password: '123456',
      username: 'Arturo',
      data_naixement: new Date( '1990-01-01' ),
      sexe: 'GenderFluid',
      pais: 'Espanya',
      codi_postal: 08820,
      canal: {
        _id: 1,
        nom: 'Me gustan las tortugas',
        descripcio: 'Canal de tortugas',
        creacio: new Date( '2019-01-01' ),
        suscriptors: [
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
    },
    {
      _id: 2,
      email: 'usuari2@usuari2',
      password: '123456',
      username: 'Rosalia',
      data_naixement: '1990-01-01',
      sexe: 'Dona',
      pais: 'Espanya',
      codi_postal: 08020,
      canal: {
        _id: 1,
        nom: 'Motomami Channel',
        descripcio: 'El canal de les Motomamis',
        creacio: new Date( '2019-01-01' ),
        suscriptors: [
          {
            $ref: 'usuaris',
            $_id: 1
          },
          {
            $ref: 'usuaris',
            $_id: 2
          }
        ],
        playlists: [
          {
            _id: 1,
            nom: 'Ball de la Motomami',
            data_creacio: new Date( '2019-01-01' ),
            estat: 'Públic',
          }
        ],
        videos: [
          {
            _id: 1,
            titol: 'Qui és la Motomami?',
            descripcio: 'La Motomami és una persona molt especial',
            data_creacio: new Date( '2019-01-01' ),
            tamany: 400,
            nom_arxiu: 'Ball.mp4',
            durada: '00:01:00',
            miniatura: 'miniatura.jpg',
            reproduccions: 100,
            likes: [
              {
                usuari: {
                  $ref: 'usuaris',
                  $_id: 2,
                  data: new Date( '2019-01-01' )
                }
              }
            ],
            dislikes: [
              {
                usuari: {
                  $ref: 'usuaris',
                  $_id: 1,
                  data: new Date( '2019-01-01' )
                }
              }
            ],
            estat: 'Públic',
            etiquetes: [
              {
                $ref: 'etiquetes',
                $_id: 1
              }
            ],
            playlists: {
              $ref: 'playlists',
              $_id: 1
            },
            data_pujada: new Date( '2019-01-01' ),
            etiquetes: [
              {
                _id: 1,
                nom: 'Tutorial de ball',
                data_creacio: new Date( '2019-01-01' ),
                estat: 'Privada',
                usuari_id: {
                  $ref: 'usuaris',
                  $_id: 2
                }
              }
            ],
            comentaris: [
              {
                _id: 1,
                text: 'Molt bon vídeo',
                data_i_hora: new Date( '2019-01-01' ),
                likes: [
                  {
                    usuari: {
                      $ref: 'usuaris',
                      $_id: 1,
                      data: new Date( '2019-01-01' )
                    }
                  }
                ],
                dislikes: [
                  {
                    usuari: {
                      $ref: 'usuaris',
                      $_id: 1,
                      data: new Date( '2019-01-01' )
                    }
                  }
                ]
              }
            ]
          }

        ]
      }
    },
    {
      _id: 3,
      email: 'lidertransformers@gmail.com',
      password: '123456',
      username: 'OptimusPrime',
      data_naixement: '1000 a.c.',
      sexe: 'Robot',
      pais: 'Cybertron',
      codi_postal: 08820,
      canal: {
        _id: 3,
        nom: 'Com liderar un grup de Transformers',
        descripcio: 'Canal de lideratge',
        creacio: new Date( '2019-01-01' ),
        suscriptors: [
          {
            $ref: 'usuaris',
            $_id: 1
          },
          {
            $ref: 'usuaris',
            $_id: 2
          }
        ],
        playlists: [
          {
            _id: 1,
            nom: 'Lideratge de Transformers: els autobots',
            data_creacio: new Date( '2019-01-01' ),
            estat: 'Publica'
          }
        ],
        videos: [
          {
            _id: 1,
            títol: 'Objectes en que es transformen els Transformers',
            descripció: 'Els Transformers es transformen en objectes que els rodegen',
            tamany: 1000,
            nom_arxiu: 'transformers.mp4',
            durada: '00:10:00',
            miniatura: 'miniatura-transformer.jpg',
            reproduccions: 14345,
            likes: [
              {
                usuari: {
                  $ref: 'usuaris',
                  $_id: 1,
                  data: new Date( '2019-01-01' )
                }
              }
            ],
            dislikes: [
              {
                usuari: {
                  $ref: 'usuaris',
                  $_id: 2,
                  data: new Date( '2019-01-01' )
                }
              }
            ],
            estat: 'Públic',
            etiquetes: [
              {
                $ref: 'etiquetes',
                $_id: 1
              },
              {
                $ref: 'etiquetes',
                $_id: 2
              }
            ],
            playlists: {
              $ref: 'playlist',
              $_id: 2
            },
            data_pujada: new Date( '2019-01-01' ),
            etiquetes: [
              {
                _id: 1,
                nom: 'Tutorial de lideratge dels Transformers',
                data_creacio: new Date( '2019-01-01' ),
                estat: 'Públic',
                usuari_id: {
                  $ref: 'usuaris',
                  $_id: 2
                }
              }
            ],
            comentaris: [
              {
                _id: 1,
                text: 'Hola, Optimus. Molt bon vídeo. He après moltíssim',
                data_i_hora: new Date( '2019-01-01' ),
                likes: [
                  {
                    usuari: {
                      $ref: 'usuaris',
                      $_id: 2,
                      data: new Date( '2019-01-01' )
                    }
                  },
                  {
                    usuari: {
                      $ref: 'usuaris',
                      $_id: 1,
                      data: new Date( '2019-01-01' )
                    }
                  }
                ],
                dislikes: [
                  {
                    usuari: {
                      $ref: 'usuaris',
                      $_id: 2,
                      data: new Date( '2019-01-01' )
                    }
                  }
                ],
                video_id: {
                  $ref: 'videos',
                  $_id: 1
                },
                usuari_id: {
                  $ref: 'usuaris',
                  $_id: 2
                }
              }
            ]
          }
        ]
      }
    }
  ]
);

db.usuaris.find().pretty();
