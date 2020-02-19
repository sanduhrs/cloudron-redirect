"use strict";

var http = require("http");

const dotenv = require('dotenv');
dotenv.config();

var server = http.createServer(function (request, response) {
  if (process.env.TIMEOUT == 0) {
    response.writeHead(302, {"Location": process.env.URL});
  }
  response.write(`<html><head><meta http-equiv="refresh" content="${process.env.TIMEOUT}; URL='${process.env.URL}'" /><body>${process.env.MESSAGE}`);
  response.end();
});

server.listen(3000);

console.log("Server running at port 3000");
