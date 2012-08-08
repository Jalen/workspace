var express = require('express'),
    app = express();

app.use(express.logger());

// Setup the route for the root...
app.get('/', function(req, res){
    res.send('Hello World');
});

app.listen(3000);
console.log('Express server started on port %s', app);
