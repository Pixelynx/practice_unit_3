const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const port = 5000;
const userRoute = require('./routes/users');
const postRoute = require('./routes/posts');
const likesRoute = require('./routes/likes');
const picRoute = require('./routes/pictures');
const albumRoute = require('./routes/albums');

app.use(bodyParser.urlencoded(
  { extended: false }
));

app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send(`Home Page`);
});

app.listen(port, () => {
  console.log(`Listening to port ${port}.`);
});
