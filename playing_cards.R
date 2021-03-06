
deck <- read.csv("https://s3.us-east-1.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/1618705129__deck.csv")

View(deck)

shuffle <- function(players, hand_size){
  x <- players * hand_size # determine how many cards are needed
  
  # If else to determine if more than 52 cards are needed
  if (x > 52){
    
    return(paste("Not enough cards to play"))
    
  }else{
    
    cards <- sample(x=deck$X, size=x, replace=FALSE) # return a sample of the total needed cards
    
    player1 <- deck[deck$X %in% cards[1:5],] # assign first 5 cards to player 1
    player2 <- deck[deck$X %in% cards[6:10],] # assign last 5 cards to player 2
    
    return(list(player1, player2)) # return a list containing both players hands
    
  }
}

hands <- shuffle(2,5) # create hands

hands[1] # player 1 hand
hands[2] # player 2 hand
