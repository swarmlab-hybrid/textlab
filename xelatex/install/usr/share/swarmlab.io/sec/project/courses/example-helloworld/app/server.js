var path = require('path');
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);


app.get('/', (req, res) => {
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
