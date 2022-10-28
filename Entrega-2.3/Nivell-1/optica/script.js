const { MongoClient } = require( 'mongodb' );

const url = 'mongodb://localhost:27017';

const client = new MongoClient( url, { useUnifiedTopology: true } );

async function run () {
  try {
    await client.connect();
    const database = client.db( 'optica' );
    const gafas = database.collection( 'gafas' );
    const proveedores = database.collection( 'proveedores' );
    const clientes = database.collection( 'clientes' );
    const pedidos = database.collection( 'pedidos' );
    const empleados = database.collection( 'empleados' );

    const gafasResult = await gafas.insertMany( [
      {
        _id: 1, marca: 'Ray-Ban', modelo: 'RB 3025', color: 'amarillo', precio: 100, graduacion_1: 1.5, graduacion_2: 0.7,
      },
      {
        _id: 2, marca: 'Ray-Ban', modelo: 'RB 3025', color: 'rojo', precio: 150, graduacion_1: 1.5, graduacion_2: 0.8,
      },
      {
        _id: 3, marca: 'Ray-Ban', modelo: 'RB 3025', color: 'azul', precio: 200, graduacion_1: 1.5, graduacion_2: 0.9,
      },
      {
        _id: 4, marca: 'Ray-Ban', modelo: 'RB 3025', color: 'verde', precio: 90, graduacion_1: 1.5, graduacion_2: 1.0,
      }
    ] );

    const proveedoresResult = await proveedores.insertMany( [
      {
        _id: 1, nombre: 'Proveedor 1', direccion: 'Calle de la Proveiduría 1', telefono: 123456789, fax: 1345678235, email: 'proveedor1@gmail.com', ciudad: 'Barcelona', pais: 'España', codigo_postal: 08001, NIF: '12345678A',
      },
      {
        _id: 2, nombre: 'Proveedor 2', direccion: 'Calle de la Proveiduría 2', telefono: 987654321, email: 'proveedor2@gmail', ciudad: 'Madrid', pais: 'España', codigo_postal: 28001, NIF: '87654321B',
      },
      {
        _id: 3, nombre: 'Proveedor 3', direccion: 'Calle de la Proveiduría 3', telefono: 123456789, fax: 1345678235, email: 'proveedor3@gmail.com', ciudad: 'Barcelona', pais: 'España', codigo_postal: 08001, NIF: '12345678C',
      },
      {
        _id: 4, nombre: 'Proveedor 4', direccion: 'Calle de la Proveiduría 4', telefono: 987654321, email: 'proveedor4@gmail', ciudad: 'Madrid', pais: 'España', codigo_postal: 28001, NIF: '87654321D',
      }
    ] );
    const empleadosResult = await empleados.insertMany( [
      {
        _id: 1, nombre: 'Empleado 1'
      },
      {
        _id: 2, nombre: 'Empleado 2'
      },
    ] );

    const clientesResult = await clientes.insertMany( [
      {
        _id: 1, nombre: 'Cliente 1', direccion: 'Calle del Cliente 1', telefono: 123456789, email: 'cliente1@cliente.com', ciudad: 'Barcelona', pais: 'España', codigo_postal: 08001, NIF: '12345678E', recomendado_por: null
      },
      {
        _id: 2, nombre: 'Cliente 2', direccion: 'Calle del Cliente 2', telefono: 987654321, email: 'cliente2@cliente.com', ciudad: 'Madrid', pais: 'España', codigo_postal: 28001, NIF: '87654321F', recomendado_por: {
          _id: 1, nombre: 'Cliente 1'
        }
      }
    ] );
    const pedidosResult = await pedidos.insertMany( [
      {
        _id: 1, empleado: {
          _id: 1, nombre: 'Empleado 1'
        }, cliente: {
          _id: 1, nombre: 'Cliente 1'
        }, proveedor: {
          _id: 1, nombre: 'Proveedor 1'
        }, gafa: {
          _id: 1, marca: 'Ray-Ban', modelo: 'RB 3025', color: 'amarillo', precio: 100, graduacion_1: 1.5, graduacion_2: 0.7,
        }, cantidad: 2, precio_total: 200
      },
      {
        _id: 2, empleado: {
          _id: 2, nombre: 'Empleado 2'
        }, cliente: {
          _id: 2, nombre: 'Cliente 2'
        }, proveedor: {
          _id: 2, nombre: 'Proveedor 2'
        }, gafa: {
          _id: 2, marca: 'Ray-Ban', modelo: 'RB 3025', color: 'rojo', precio: 150, graduacion_1: 1.5, graduacion_2: 0.8,
        }, cantidad: 3, precio_total: 450
      }
    ] );
  }
  catch ( error ) {
    console.log( error );
  }
  finally {
    await client.close();
  }
}

run().catch( console.dir );
