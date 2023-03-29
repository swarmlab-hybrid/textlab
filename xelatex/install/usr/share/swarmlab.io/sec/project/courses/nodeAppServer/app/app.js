var express = require('express');
var http = require('http');
const MongoClient = require('mongodb').MongoClient;

var PORT = 8085;

var app = express();
app.get('/', function(req, res) {
	var RES ={}
    	var message = req.query["log"]

	// Connection URL
	var database   = "app_swarmlab"
	var user  	 = "swarmlab"
	var password 	 = "swarmlab"
	var collection = "logs"
	var replica_set = "rs0"
	var nodes = "swarmlabmongo1:27017,swarmlabmongo2:27017,swarmlabmongo3:27017"
	//var url = `mongodb://${user}:${password}@${nodes}/${database}?replicaSet=${replica_set}&authSource=admin`

 var mongourl = "mongodb://"+user+":"+password+"@swarmlabmongo1:27017,swarmlabmongo2:27017,swarmlabmongo3:27017/app_swarmlab?replicaSet=rs0&authSource=admin&w=1"
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
    		res.send({message: message, data:item});

              })
    });
});

app.post('/', function(req, res) {
    var message = req.body["log"]
    console.log(JSON.stringify(message))
    //console.log(req)
    res.send({message: message});
});

http.Server(app).listen(PORT, function() {
    console.log("HTTP server listening on port %s", PORT);
});

