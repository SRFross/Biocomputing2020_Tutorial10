##Shaneann Fross
##Exercise 08 Biocomputing

setwd("/Users/Shaneann/Desktop/data-shell/Biocomputing2020_Tutorial10")

##1. Create a graph with cumulative scores

#read in data frame
game <- read.delim(file="UWvMSU_1-22-13.txt", header=TRUE, stringsAsFactors=FALSE) 

#Create a cumulative scores matrix
##First, count up how many times there was a score to preallocate a matrix
scoreCountUW <- sum(game$team == "UW")
scoreCountMSU <- sum(game$team == "MSU")

#make the preallocate matrix
cumulativeSumUW <- matrix(data = 0, nrow = 23)
cumulativeSumMSU <- matrix(data = 0, nrow = 27)

#Struggled to make it count up and add cumulatively when all together. So draw out only one team from the table and cumSum from there
UWonly <- game[game[,2] == "UW",]
MSUonly <- game[game[,2] == "MSU",]

#Do a cumulative sum
for(i in 1:length(cumulativeSumUW)){
  cumulativeSumUW[i] = sum(UWonly$score[1:i])  
}

for(i in 1:length(cumulativeSumMSU)){
  cumulativeSumMSU[i] = sum(MSUonly$score[1:i])  
}

#Plot the data
plot(cumulativeSumMSU, type = "l", col = "blue", xlab = "Number of baskets", ylab = "cummulative score")
lines(cumulativeSumUW, type = "l", col = "red")



##2. Make the "Guess my number" game
#Generate a random number and save
computerNumber <- sample(1:100, 1, replace = FALSE)

#Make a loop which takes the input from the user and as long as the guess count is below 11 times goes through an if/else 
count = 0

while(count < 11){ 
  userGuess <- readline(prompt="Please guess a number between 1 and 100: ")
  userGuess <- as.integer(userGuess)
  
  if(userGuess == computerNumber){ 
    print("Correct!")
    count <- count + 11
  }else if(userGuess > computerNumber){
    print("Guess Lower!")
    count <- count + 1   
  }else{
    print("Guess Higher")
    count <- count + 1
  }
}




