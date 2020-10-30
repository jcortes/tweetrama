const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const http = require("http");
const twitter = require("./twitter");

const PORT = 8002;
const SEARCH_TWEETS_PATH = "search/tweets";
const app = express();

app.use(cors());
app.use(bodyParser.json());

app.post("/test/:query", (req, res) => {
  const { query } = req.params;
  // from:jacortesmahmud namaskaram until:2020-10-28 since:2020-10-25 -filter:replies
  const user = "from:jacortesmahmud";
  const q = `${user}${text}`;

  console.log('QUERY!!!', q);

  const params = { q, count: 100 };
  twitter.get(SEARCH_TWEETS_PATH, params, (error, tweets, response) => {
    res.send(tweets);
  });
});

const server = http.createServer(app);

server.listen(PORT, () => {
  console.log(`App is running at http://localhost:${PORT}`);
});

