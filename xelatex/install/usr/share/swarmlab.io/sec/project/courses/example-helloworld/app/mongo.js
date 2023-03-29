var path = require('path');
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
const MongoClient = require('mongodb').MongoClient;


app.get('/test', (req, res) => {

		var user="swarmlab"
		var pass="swarmlab"

		/*
		use admin
		db.createUser(
			 {
				 user: "test1",
				 pwd: 'newpass',      // Or  "<cleartext password>"
				 roles: [ { role: "readWrite", db: "app_swarmlab" } ],
				 authenticationRestrictions: [ {
						clientSource: ["192.168.1.7"],
						serverAddress: ["192.168.80.2", "192.168.80.3", "192.168.80.4"]
				 } ]
			 }
		)
		*/

	 var mongourl = "mongodb://"+user+":"+pass+"@swarmlabmongo1:27017,swarmlabmongo2:27017,swarmlabmongo1:27017/app_swarmlab?replicaSet=rs0&authSource=admin&w=1"
	 const OPTS = {
			useNewUrlParser: true,
			useUnifiedTopology: true,
			//poolSize: 10,
			tls: false
		};

		const client = new MongoClient(mongourl,OPTS);

		client.on('serverDescriptionChanged', function(event) {
			console.log('received serverDescriptionChanged');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('serverHeartbeatStarted', function(event) {
			console.log('received serverHeartbeatStarted');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('serverHeartbeatSucceeded', function(event) {
			console.log('received serverHeartbeatSucceeded');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('serverHeartbeatFailed', function(event) {
			console.log('received serverHeartbeatFailed');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('serverOpening', function(event) {
			console.log('received serverOpening');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('serverClosed', function(event) {
			console.log('received serverClosed');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('topologyOpening', function(event) {
			console.log('received topologyOpening');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('topologyClosed', function(event) {
			console.log('received topologyClosed');
			console.log(JSON.stringify(event, null, 2));
		});

		client.on('topologyDescriptionChanged', function(event) {
			console.log('received topologyDescriptionChanged');
			console.log(JSON.stringify(event, null, 2));
		});

		client.connect(function(err, client) {
			if(err) throw err;

				const db = client.db('app_swarmlab');
					db.collection('logs').find({}).toArray()
						.then(item => {
								console.log('item '+JSON.stringify(item))
								for (let i in item) {
									console.log(JSON.stringify('items' + item[i]))
								 }
							})
		});

		res.send('<h1>Hello world!</h1>');
});

io.on('connection', s => {
      console.error('socket connection');

   s.on('log', (data, room) => {
      console.log('broadcast', data);
  });

});

http.listen(8084, () => console.error('listening on http://localhost:8084/'));
console.error('socket.io example');
