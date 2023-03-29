
const app = require('express')();
const http = require('http').Server(app);
var path = require('path');

options = {
        secure:true,
        reconnect: true,
        rejectUnauthorized : false
};


var io2 = require('socket.io-client');
var socket = io2.connect('http://localhost:8084', options);

var msg2 = "c= 120";
socket.emit('log', msg2);

/*
var io = require('socket.io')(http);

app.get('/log', (req, res) => {
  socket.emit('log', 'send from get');
  res.send('<h1>send</h1>');
});

http.listen(8085, () => {
  console.log('listening on *:8085');
});
*/

