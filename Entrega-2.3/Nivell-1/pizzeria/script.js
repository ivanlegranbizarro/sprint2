const { MongoClient } = require( 'mongodb' );

const url = 'mongodb://localhost:27017';

const client = new MongoClient( url, { useUnifiedTopology: true } );

async function run () {
  try {
    await client.connect();
    const database = client.db( 'pizzeria' );
    const tienda = database.collection( 'tienda' );
    const clientes = database.collection( 'clientes' );
    const empleados = database.collection( 'empleados' );
    const productos = database.collection( 'productos' );
    const categoria = database.collection( 'categoria' );
    const comanda = database.collection( 'comanda' );
    const pedidos = database.collection( 'pedidos' );

    const datosTienda = await tienda.insertOne( {
      _id: 1,
      nombre: 'Pizzeria La Mamma',
      direccion: 'Carrer de la Pau',
      telefono: '934 56 78 90',
      email: 'pizzeriamamma@gmail.com',
      localidad: 'Barcelona',
      provincia: 'Barcelona',
      codigoPostal: '08001',
    } );

    const datosClientes = await clientes.insertMany(
      [ {
        _id: 1,
        nombre: 'Pepito',
        apellidos: 'Grillo',
        direccion: 'Carrer de la Pau',
        telefono: '934 56 78 90',
        email: 'cliente1@gmail.com',
        localidad: 'Barcelona',
        provincia: 'Barcelona',
        codigoPostal: '08001',
      }, {
        _id: 2,
        nombre: 'Pepita',
        apellidos: 'Grillo',
        direccion: 'Carrer de la Pau',
        telefono: '934 56 78 90',
        email: 'cliente2@gmail.com',
        localidad: 'Barcelona',
        provincia: 'Barcelona',
        codigoPostal: '08001',
      } ] );

    const datosEmpleados = await empleados.insertMany( [ {
      _id: 1,
      nombre: 'Arturo',
      apellidos: 'Perez',
      telefono: '934 56 78 90',
      puesto: 'Cocinero',
      NIF: '12345678A',

    }, {
      _id: 2,
      nombre: 'Estefanía',
      apellidos: 'García',
      telefono: '934 56 78 90',
      puesto: 'Repartidor',
      NIF: '12345678B',
    } ] );

    const datosProductos = await productos.insertMany( [ {
      _id: 1,
      nombre: 'Pizza Margarita',
      descripcion: 'Pizza con tomate, mozzarella y albahaca',
      precio: 8,
      categoria: 'pizza',
    }, {
      _id: 2,
      nombre: 'Pizza Carbonara',
      descripcion: 'Pizza con tomate, mozzarella, bacon y huevo',
      precio: 10,
      categoria: 'pizza',
    },
    {
      _id: 3,
      nombre: 'Cola Light',
      descripcion: 'Refresco de cola light',
      precio: 2,
      categoria: 'bebida',
    },

    {
      _id: 4,
      nombre: 'Cerveza Fresquita',
      descripcion: 'Cerveza de barril',
      precio: 2,
      categoria: 'bebida',
    }
    ] );

    const datosCategoria = await categoria.insertMany( [ {
      _id: 1,
      nombre: 'pizza',
    }, {
      _id: 2,
      nombre: 'bebida',
    },
    {
      _id: 3,
      nombre: 'hambuguesa',
    }
    ] );


    const datosComanda = await comanda.insertMany( [ {
      _id: 1,
      fecha: '2020-12-01',
      cliente: {
        _id: 1
      },
      empleado: {
        _id: 1
      },
      productos: [
        {
          _id: 1,
          cantidad: 1
        },
        {
          _id: 3,
          cantidad: 2
        }
      ],
      total: 12
    }, {
      _id: 2,
      fecha: '2020-12-01',
      cliente: {
        _id: 2
      },
      empleado: {
        _id: 2
      },
      productos: [
        {
          _id: 2,
          cantidad: 1
        },
        {
          _id: 4,
          cantidad: 1
        }
      ],
      total: 12
    } ] );

    const datosPedidos = await pedidos.insertMany( [
      {
        _id: 1,
        fecha: '2020-12-01',
        comanda: {
          _id: 1
        },
        repartidor: {
          _id: 2
        },
        entrega: 'Domicilio',
        estado: 'Enviado',
      },
      {
        _id: 2,
        fecha: '2020-12-01',
        comanda: {
          _id: 2
        },
        repartidor: {
          _id: 2
        },
        entrega: 'Local',
        estado: 'Entregado',
      },
    ] );
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
