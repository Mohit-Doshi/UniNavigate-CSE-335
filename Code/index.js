var package = require("./package.json");
var myNewApi = require("./lib/my_new_api.js");
console.log("loaded " + package.name + ", version " + package.version);
exports.handler = function (event, context) {
myNewApi.handleRequest(event, context.done);
}

