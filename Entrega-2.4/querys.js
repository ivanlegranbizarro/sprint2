const { MongoClient } = require( 'mongodb' );

const url = 'mongodb://localhost:27017';

const client = new MongoClient( url, { useUnifiedTopology: true } );

async function run () {
  try {
    await client.connect();
    const database = client.db( 'restaurants' );

    const collection = database.collection( 'restaurants' );

    collection.find( {} );

    collection.find( {}, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( {}, { projection: { restaurant_id: 1, name: 1, borough: 1, address: { zipcode: 1 }, cuisine: 1, _id: 0 } } );
    collection.find( { borough: 'Bronx' } );
    collection.find( { borough: 'Bronx' } ).limit( 5 );
    collection.find( { borough: 'Bronx' } ).skip( 5 ).limit( 5 );
    collection.find( { grades: { $elemMatch: { score: { $gt: 90 } } } } );
    collection.find( { grades: { $elemMatch: { score: { $gt: 80, $lt: 100 } } } } );
    collection.find( { 'address.coord': { $lt: -95.754168 } } );
    collection.find( { cuisine: { $ne: 'American ' }, grades: { $elemMatch: { score: { $gt: 70 } } }, 'address.coord': { $lt: -65.754168 } } );
    collection.find( { cuisine: { $ne: 'American ' }, grades: { $elemMatch: { score: { $gt: 70 } } }, 'address.coord': { $lt: -65.754168 } } );
    collection.find( { cuisine: { $ne: 'American ' }, grades: { $elemMatch: { grade: 'A' } }, borough: { $ne: 'Brooklyn' } } ).sort( { cuisine: -1 } );
    collection.find( { name: { $regex: /^Wil/ } }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { name: { $regex: /ces$/ } }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { name: { $regex: /Reg/ } }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { borough: 'Bronx', $or: [ { cuisine: 'American ' }, { cuisine: 'Chinese' } ] } );
    collection.find( { borough: { $in: [ 'Staten Island', 'Queens', 'Bronx', 'Brooklyn' ] } }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { borough: { $nin: [ 'Staten Island', 'Queens', 'Bronx', 'Brooklyn' ] } }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { grades: { $elemMatch: { score: { $lt: 10 } } } }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { cuisine: 'Seafood', $nor: [ { cuisine: 'American ' }, { cuisine: 'Chinese' }, { name: { $regex: /^Wil/ } } ] }, { projection: { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } } );
    collection.find( { grades: { $elemMatch: { grade: 'A', score: 11, date: new Date( '2014-08-11T00:00:00Z' ) } } }, { projection: { restaurant_id: 1, name: 1, grades: 1 } } );
    collection.find( { grades: { $elemMatch: { grade: 'A', score: 9, date: new Date( '2014-08-11T00:00:00Z' ) } } }, { projection: { restaurant_id: 1, name: 1, grades: 1 } } );
    collection.find( { 'address.coord': { $elemMatch: { $gt: 42, $lt: 52 } } }, { projection: { restaurant_id: 1, name: 1, address: 1 } } );
    collection.find().sort( { name: 1 } );
    collection.find().sort( { name: -1 } );
    collection.find().sort( { cuisine: 1, borough: -1 } );
    collection.find( { 'address.street': { $exists: true } } );
    collection.find( { 'address.coord': { $type: 'double' } } );
    collection.find( { grades: { $elemMatch: { score: { $mod: [ 7, 0 ] } } } }, { projection: { restaurant_id: 1, name: 1, grades: 1 } } );
    collection.find( { name: { $regex: /mon/ } }, { projection: { name: 1, borough: 1, 'address.coord': 1, cuisine: 1 } } );
    collection.find( { name: { $regex: /^Mad/ } }, { projection: { name: 1, borough: 1, 'address.coord': 1, cuisine: 1 } } );

  }
  catch ( error ) {
    console.log( error );
  }
  finally {
    await client.close();
  }
}

run().catch( console.dir );
