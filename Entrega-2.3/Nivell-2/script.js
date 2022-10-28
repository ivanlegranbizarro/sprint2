const { MongoClient } = require( 'mongodb' );

const url = 'mongodb://localhost:27017';

const client = new MongoClient( url, { useUnifiedTopology: true } );

async function run () {
  try {
    await client.connect();
    const database = client.db( 'youtube' );
    const usuarios = database.collection( 'usuarios' );
    const videos = database.collection( 'videos' );
    const etiquetas = database.collection( 'etiquetas' );
    const canal = database.collection( 'canal' );
    const likeVideo = database.collection( 'likeVideo' );
    const dislikeVideo = database.collection( 'dislikeVideo' );
    const comentarios = database.collection( 'comentarios' );
    const suscripciones = database.collection( 'suscripciones' );
    const playlists = database.collection( 'playlists' );
    const likeComentario = database.collection( 'likeComentario' );
    const dislikeComentario = database.collection( 'dislikeComentario' );

    const datosUsuarios = await usuarios.insertMany( [ {
      _id: 1,
      nombre: 'Arturo',
      apellidos: 'Perez',
      telefono: '934 56 78 90',
      email: 'usuario1@usuario.com',
      direccion: 'Carrer de la Pau',
      localidad: 'Barcelona',
      provincia: 'Barcelona',
      codigoPostal: '08001',
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
    } ] );

    const datosCanal = await canal.insertOne( {
      _id: 1,
      nombre: 'Canal de Arturo',
      descripcion: 'Canal de Arturo Perez',
      fechaCreacion: '2020-10-10',
      fechaModificacion: '2020-10-10',
      usuario: {
        _id: 1,
      }
    } );

    const datosEtiquetas = await etiquetas.insertMany( [ {
      _id: 1,
      nombre: 'Etiqueta 1',
    }, {
      _id: 2,
      nombre: 'Etiqueta 2',
    } ] );


    const datosVideos = await videos.insertMany( [ {
      _id: 1,
      titulo: 'Video 1',
      descripcion: 'Descripcion del video 1',
      fecha: '2020-01-01',
      duracion: '00:01:00',
      usuario: {
        _id: 1,
      },
      tamaño: '1MB',
      formato: 'mp4',
      thumbnail: 'thumbnail1.jpg',
      canal: {
        _id: 1,
      },
      etiquetas: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      comentarios: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      likes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      dislikes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
    }, {
      _id: 2,
      titulo: 'Video 2',
      descripcion: 'Descripcion del video 2',
      fecha: '2020-01-01',
      duracion: '00:01:00',
      usuario: {
        _id: 2,
      },
      tamaño: '1MB',
      formato: 'mp4',
      thumbnail: 'thumbnail2.jpg',
      canal: {
        _id: 2,
      },
      etiquetas: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      comentarios: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      likes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      dislikes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
    } ] );

    const datoslikeVideo = await likeVideo.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      video: {
        _id: 1,
      },
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      video: {
        _id: 1,
      },
    } ] );

    const datosdislikeVideo = await dislikeVideo.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      video: {
        _id: 1,
      },
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      video: {
        _id: 1,
      },
    } ] );

    const datosComentarios = await comentarios.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      video: {
        _id: 1,
      },
      fecha: '2020-01-01',
      texto: 'Comentario 1',
      likes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      dislikes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      video: {
        _id: 1,
      },
      fecha: '2020-01-01',
      texto: 'Comentario 2',
      likes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
      dislikes: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
    } ] );

    const datosSuscripciones = await suscripciones.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      canal: {
        _id: 1,
      },
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      canal: {
        _id: 1,
      },
    } ] );

    const datosPlaylists = await playlists.insertMany( [ {
      _id: 1,
      nombre: 'Playlist 1',
      descripcion: 'Descripcion de la playlist 1',
      fechaCreacion: '2020-01-01',
      fechaModificacion: '2020-01-01',
      usuario: {
        _id: 1,
      },
      videos: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
    }, {
      _id: 2,
      nombre: 'Playlist 2',
      descripcion: 'Descripcion de la playlist 2',
      fechaCreacion: '2020-01-01',
      fechaModificacion: '2020-01-01',
      usuario: {
        _id: 2,
      },
      videos: [ {
        _id: 1,
      }, {
        _id: 2,
      } ],
    } ] );

    const datosLikeComentario = await likeComentario.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      comentario: {
        _id: 1,
      },
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      comentario: {
        _id: 1,
      },
    } ] );


    const datosDislikeComentario = await dislikeComentario.insertMany( [ {
      _id: 1,
      usuario: {
        _id: 1,
      },
      comentario: {
        _id: 1,
      },
    }, {
      _id: 2,
      usuario: {
        _id: 2,
      },
      comentario: {
        _id: 1,
      },
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
