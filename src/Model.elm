module Model exposing (State)

type alias State = 
  { content : String
  , tweets : List String
  , date : String
  }