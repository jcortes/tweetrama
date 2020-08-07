API Key
IFSoZJhchDncaAL4z5m7sk1ph

API secret key
OXLnVsPxn6WskBBAeeStq5Z10SsQ82ith4OauP7Q8BjZBBjay3

Bearer token
AAAAAAAAAAAAAAAAAAAAAP08GQEAAAAA%2BI0kI%2BWe6dt9pps5AMlsbLT4zCk%3D2jQCEjRJYcq0FF9bin84jAdE43ZTkRwpyixtJsWIkOMz1vrQUn

Access token
39820044-boKWsKkHQBO8a4uudfCGtVPaCxWGn08wgjkRB0VIg

Access token secret:
KhDvAlFjUmGGDSWKMSLC2lO8wCBMMBcFGCxgc9pzyG5cK

#################
var oauth_nonce;
crypto.randomBytes(21, function(err, buffer) { console.log(buffer.toString('hex')); });

var now = new Date()
var oauth_timestamp = Math.round(now.getTime() / 1000)

GET https://api.twitter.com/1.1/search/tweets.json&include_entities=true&oauth_consumer_key=IFSoZJhchDncaAL4z5m7sk1ph&oauth_nonce=003de9ed4c752caaacee40f72141a19b3a597c17fa&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1596168752&oauth_token=39820044-boKWsKkHQBO8a4uudfCGtVPaCxWGn08wgjkRB0VIg&oauth_version=1.0&q=from%3Atwitterdev&result_type=mixed&count=2

var signatureBaseStr = 'GET&https%3A%2F%2Fapi.twitter.com%2F1.1%2Fsearch%2Ftweets.json&include_entities%3Dtrue%26oauth_consumer_key%3DIFSoZJhchDncaAL4z5m7sk1ph%26oauth_nonce%3D003de9ed4c752caaacee40f72141a19b3a597c17fa%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1596168752%26oauth_token%3D39820044-boKWsKkHQBO8a4uudfCGtVPaCxWGn08wgjkRB0VIg%26oauth_version%3D1.0%26q%3Dfrom%253Atwitterdev%26result_type%3Dmixed%26count%3D2';
var signingKey = 'OXLnVsPxn6WskBBAeeStq5Z10SsQ82ith4OauP7Q8BjZBBjay3&KhDvAlFjUmGGDSWKMSLC2lO8wCBMMBcFGCxgc9pzyG5cK';

var binaryStr = crypto.createHmac('sha1', signingKey).update(signatureBaseStr).digest('hex');
var oauthSignature = Buffer.from(binaryStr).toString('base64');

OAuth signature
NDA1N2FjODBkM2JhYWZiM2Y1YTQxYzAzYzE2YjdkM2Q3NWYxYTE2Nw==

################

curl -X GET https://api.twitter.com/1.1/search/tweets.json?q=from%3Amatarife&result_type=mixed&count=2 \
  -H 'authorization: OAuth oauth_consumer_key="IFSoZJhchDncaAL4z5m7sk1ph",
  oauth_nonce="003de9ed4c752caaacee40f72141a19b3a597c17fa", oauth_signature="NDA1N2FjODBkM2JhYWZiM2Y1YTQxYzAzYzE2YjdkM2Q3NWYxYTE2Nw==",
  oauth_signature_method="HMAC-SHA1", oauth_timestamp="1596168752",
  oauth_token="39820044-boKWsKkHQBO8a4uudfCGtVPaCxWGn08wgjkRB0VIg", oauth_version="1.0"'

 