const { MongoClient } = require( 'mongodb' );

const url = 'mongodb://localhost:27017';

const client = new MongoClient( url, { useUnifiedTopology: true } );

async function run () {
  try {
    await client.connect();
    const database = client.db( 'restaurants' );
    const restaurants = database.collection( 'restaurants' );


    const datosRestaurants = restaurants.insertMany( [

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