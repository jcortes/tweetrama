# Requirements
* Linux System 🙏
* NPM
* ELM

# Client
## Run
```
$ elm reactor
```

Then go to `http://localhost:8000/src/Main.elm`

# Server
## Setup
Save this to `./server/.env` file
```
export CONSUMER_KEY=<key>
export CONSUMER_SECRET=<secret>
export ACCESS_TOKEN_KEY=<token_key>
export ACCESS_TOKEN_SECRET=<token_secret>
```

The source it like this:
```
$ source .env
```

## Run
```
$ cd server
$ npm i
$ npm run start
```

Then go to `http://localhost:8002/test/matarife`