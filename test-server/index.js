const http = require('http');

const requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World! ' + new Date().toISOString());
}

const server = http.createServer(requestListener);
server.listen(80);