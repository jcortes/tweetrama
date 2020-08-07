const Twitter = require("twitter");

const {
  CONSUMER_KEY,
  CONSUMER_SECRET,
  ACCESS_TOKEN_KEY,
  ACCESS_TOKEN_SECRET
} = process.env;

if (
  !CONSUMER_KEY ||
  !CONSUMER_SECRET ||
  !ACCESS_TOKEN_KEY ||
  !ACCESS_TOKEN_SECRET
) {
  throw new Error("All environment variables need to be set to establish a connection to twitter!")
}

const twitter = new Twitter({
  consumer_key: CONSUMER_KEY,
  consumer_secret: CONSUMER_SECRET,
  access_token_key: ACCESS_TOKEN_KEY,
  access_token_secret: ACCESS_TOKEN_SECRET
});

module.exports = twitter;