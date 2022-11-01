const { MongoClient } = require( 'mongodb' );

const url = 'mongodb://localhost:27017';

const client = new MongoClient( url, { useUnifiedTopology: true } );

async function run () {
  try {
    await client.connect();
    const database = client.db( 'spotify' );
    const usuarios = database.collection( 'usuarios' );
    const suscripciones = database.collection( 'suscripciones' );
    const tarjetaCredito = database.collection( 'tarjetaCredito' );
    const PayPal = database.collection( 'PayPal' );
    const pago = database.collection( 'pago' );
    const canciones = database.collection( 'canciones' );
    const playlists = database.collection( 'playlists' );
    const artistas = database.collection( 'artistas' );
    const album = database.collection( 'album' );
    const likeAlbum = database.collection( 'likeAlbum' );
    const likeCancion = database.collection( 'likeCancion' );
    const seguirArtista = database.collection( 'seguirArtista' );
    const seguirPlaylist = database.collection( 'seguirPlaylist' );
    const artistaSegunGenero = database.collection( 'artistaSegunGenero' );
    const generoMusical = database.collection( 'generoMusical' );

    const datosUsuarios = await usuarios.insertMany( [ {
      _id: 1,
      nombre: 'Arturo',
      apellidos: 'Perez',
      telefono: '934 56 78 90',
      email: 'usuario1@usuario',
      direccion: 'Carrer de la Pau',
      localidad: 'Barcelona',
      provincia: 'Barcelona',
      codigoPostal: '08001',
      tipo_usuario: 'Premium',
    }, {

      _id: 2,
      nombre: 'Rosalía',
      apellidos: 'MotoMami',
      telefono: '934 56 78 90',
      email: 'usuario2@usuario',
      direccion: 'Carrer de la Pau',
      localidad: 'Barcelona',
      provincia: 'Barcelona',
      codigoPostal: '08001',
      tipo_usuario: 'Premium',
    } ] );

    const datosTarjetaCredito = await tarjetaCredito.insertMany( [ {
      _id: 1,
      numero: '1234567890123456',
      fechaCaducidad: '2020-10-10',
      codigoSeguridad: '123',
      usuario: {
        _id: 1,
      }
    }, {
      _id: 2,
      numero: '1234567890123456',
      fechaCaducidad: '2020-10-10',
      codigoSeguridad: '123',
      usuario: {
        _id: 2,
      }
    } ] );

    const datosPayPal = await PayPal.insertMany( [ {
      _id: 1,
      usernamePaypal: 'usuario1Paypal',
      usuario: {
        _id: 1,
      }
    }, {
      _id: 2,
      usernamePaypal: 'usuario2Paypal',
      usuario: {
        _id: 2,
      }
    } ] );

    const datosPago = await pago.insertMany( [ {
      _id: 1,
      fecha: '2020-10-10',
      importe: 10,
      usuario: {
        _id: 1,
      },
      tarjetaCredito: {
        _id: 1,
      }
    }, {
      _id: 2,
      fecha: '2020-10-10',
      importe: 10,
      usuario: {
        _id: 2,
      },
      PayPal: {
        _id: 2,
      }
    } ] );

    const datosCanciones = await canciones.insertMany( [ {
      _id: 1,
      nombre: 'Cancion 1',
      duracion: '3:00',
      fechaLanzamiento: '2020-10-10',
      portada: 'https://imagenportadadisco.com',
      reproducciones: 0
    }, {
      _id: 2,
      nombre: 'Cancion 2',
      duracion: '3:00',
      fechaLanzamiento: '2020-10-10',
      portada: 'https://imagenportadadisco.com',
      reproducciones: 0
    } ] );

    const datosArtista = await artistas.insertMany( [ {
      _id: 1,
      nombre: 'Artista 1',
      fechaNacimiento: '2020-10-10',
      retrato: 'https://imagenretratoartista.com'
    }, {
      _id: 2,
      nombre: 'Artista 2',
      fechaNacimiento: '2020-10-10',
      retrato: 'https://imagenretratoartista.com'
    } ] );

    const datosPlaylists = await playlists.insertMany( [ {
      _id: 1,
      nombre: 'Playlist 1',
      fechaCreacion: '2020-10-10',
      portada: 'https://imagenportadaplaylist.com',
      usuario: {
        _id: 1,
      },
      canciones: {
        _id: 1,
      }
    }, {
      _id: 2,
      nombre: 'Playlist 2',
      fechaCreacion: '2020-10-10',
      portada: 'https://imagenportadaplaylist.com',
      usuario: {
        _id: 2,
      },
      canciones: {
        _id: 2,
      }
    } ] );

    const datosAlbum = await album.insertMany( [ {
      _id: 1,
      nombre: 'Album 1',
      fechaLanzamiento: '2020-10-10',
      portada: 'https://imagenportadaalbum.com',
      artista: {
        _id: 1,
      },
      canciones: {
        _id: 1,
      },
    }, {
      _id: 2,
      nombre: 'Album 2',
      fechaLanzamiento: '2020-10-10',
      portada: 'https://imagenportadaalbum.com',
      artista: {
        _id: 2,
      },
      canciones: {
        _id: 2,
      },
    } ] );

    const datosSuscripciones = await suscripciones.insertMany( [ {
      _id: 1,
      fechaInicio: '2020-10-10',
      fechaFin: '2020-10-10',
      usuario: {
        _id: 1,
      },
      pago: {
        _id: 1,
      }
    }, {
      _id: 2,
      fechaInicio: '2020-10-10',
      fechaFin: '2020-10-10',
      usuario: {
        _id: 2,
      },
      pago: {
        _id: 2,
      }
    } ] );

    const datosLikeAlbum = await likeAlbum.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      album: {
        _id: 1,
      }
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      album: {
        _id: 2,
      }
    } ] );

    const datosLikeCancion = await likeCancion.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      cancion: {
        _id: 1,
      }
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      cancion: {
        _id: 2,
      }
    } ] );

    const datosSeguirPlaylist = await seguirPlaylist.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      playlist: {
        _id: 1,
      }
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      playlist: {
        _id: 2,
      }
    } ] );

    const datosSeguirArtista = await seguirArtista.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      artista: {
        _id: 1,
      }
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      artista: {
        _id: 2,
      }
    } ] );

    const datosGeneroMusical = await generoMusical.insertMany( [ {
      _id: 1,
      nombre: 'Rock'
    }, {
      _id: 2,
      nombre: 'Flamenco'
    } ] );

    const datosArtistaSegunGenero = await artistaSegunGenero.insertMany( [ {
      _id: 1,
      artista: {
        _id: 1,
      },
      generoMusical: {
        _id: 1,
      }
    }, {
      _id: 2,
      artista: {
        _id: 2,
      },
      generoMusical: {
        _id: 2,
      }
    } ] );

    console.log( 'Datos insertados correctamente' );
  }
  catch ( error ) {
    console.log( error );
  }
  finally {
    await client.close();
  }
}

run().catch( console.dir );