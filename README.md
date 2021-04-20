# R-assignment-coding-dojo
#assignment1
Create a 10 sided dice.
Create a function to rolls 6 of these dice at a time and calculate the sum and
Make sure to save all of your functions on a script called rolling.R
_______
#answer_1assignment
sample3 <-rolling (rool) 
  rool<-sample(1:10 , 6 , TRUE); rool
  sum(rool)
#optional 
  count <- 0
     for (val in rool) {
    if(val >6 ) 
      count = count+1
  }
  print(count)
  ___________________________________________________
#assignment2
Shuffle the deck (Function 1)
Deal 5  to the players depending on how many players there are.
If you don't have enough cards for how many players then your function should output that there are not enough cards for everyone before dealing. (Function 2)
Save the cards each player gets to a variable designated for that player.
_________
  #answer_2assignment
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
____________________________________________________
#assignment3
Using your shuffle and deal function from yesterday create the following if-else statements (You may also need a for-loop to accomplish this task):
Create a 2 player game and calculate the value of each hand using the "Value" column and create an if-else statement that says if player 1 or player 2 has more points. Your output should show if Player 1 or Player 2 has more points by saying "Player 1 has more points than Player 2. Player 1: <point value here>, Player 2: <point value here>"
Create a 3 player game and do the same thing as Task 1 and determine who has the highest value hand
  __________
  #answer_3assignment
  df = read.csv("https://s3.us-east-1.amazonaws.com/General_V88/boomyeah2015/codingdojo/curriculum/content/chapter/1618705129__deck.csv")
View(df)

#Create a 2 player game

shuffle = function(players, hand_size){
  x = players * hand_size # determine how many cards are needed
  
  # If else to determine if more than 52 cards are needed
  if (x > 52){
    return(paste("Not enough cards to play"))
    
  }else{
    
    cards <- sample(x=df$X, size=x, replace=FALSE) # return a sample of the total needed cards
    
    player1 <- df[df$X %in% cards[1:5],] # assign first 5 cards to player 1
    player2 <- df[df$X %in% cards[6:10],] # assign last 5 cards to player 2
    
    return(list(player1, player2)) # return a list containing both players hands
    
  }
}

hands <- shuffle(2,5) # create hands

hands[1] # player 1 hand
hands[2] # player 2 hand

hands1 = data.frame(hands[1])      
sum1 <- sum(hands1$value)
sum1
hands2 = data.frame(hands[2])      
sum2 <- sum(hands2$value)
sum2


if (sum1 > sum2) {
  print("Player 1 has more points than Player 2.")
} else {print("Player 2 has more points than Player 1.")
}



#---------------------------
#Create a 3 player game

shuffle = function(players, hand_size){
  x = players * hand_size # determine how many cards are needed
  
  # If else to determine if more than 52 cards are needed
  if (x > 52){
    return(paste("Not enough cards to play"))
    
  }else{
    
    cards <- sample(x=df$X, size=x, replace=FALSE) # return a sample of the total needed cards
    
    player1 <- df[df$X %in% cards[1:5],] # assign first 5 cards to player 1
    player2 <- df[df$X %in% cards[6:10],] # assign last 5 cards to player 2
    player3 <- df[df$X %in% cards[11:16],] # assign last 5 cards to player 3
    
    return(list(player1, player2, player3)) # return a list containing both players hands
  }
}

hands <- shuffle(3,5) # create hands

hands[1] # player 1 hand
hands[2] # player 2 hand
hands[3] # player 3 hand

hands1 = data.frame(hands[1])      
sum1= sum(hands1$value)
sum1
hands2 = data.frame(hands[2])      
sum2= sum(hands2$value)
sum2
hands3 = data.frame(hands[2])      
sum3= sum(hands3$value)
sum3

if (sum1 > sum2 & sum3 ) {
  print("Player 1 has more points.")
} else if(sum2 > sum1 & sum3 ){
  print("Player 2 has more points.")
} else {
  print("Player 3 has more points.")
}
