module Message exposing (Msg(..))

import Http

type Msg = UserInput String
  | Search String
  | GotTweets (Result Http.Error (List String))