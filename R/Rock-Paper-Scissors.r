## Play this >> https://replit.com/@zkiddy/Rock-Paper-Scissors#main.r

## 'Rock-Paper-Scissors' mini game for your enjoy
## use fucntion 'game()'

confirm = c("Yes","No")
df_confirm = data.frame(confirm)

choice = c("Rock","Paper","Scissors")
df_choice = data.frame(choice)

draw = 0
me_count = 0
ai_count = 0
loop = "1"

game = function() {
  print("Hi. Wellcome to game 'Rock-Paper-Scissors'")
  print("What your name? :")
  name = readLines("stdin",n = 1)
  print(paste("Hi",name,"Are you ready? :"))
	readLines("stdin",n = 1)
  print("Let’s play Rock–Paper–Scissors !!")
   while (loop == "1") {
  print(df_choice)
  print("Please choose the 'number' 1-3 :")
  me_choice = readLines("stdin",n = 1)
    print(paste("You: ",df_choice[me_choice,1] ) ) 
  ai_choice = sample(choice,1)
    print(paste("Ai : ",ai_choice) )
  if (df_choice[me_choice,1] == ai_choice) {
    draw = draw + 1
    print("Oh! that draw.")
  }
  else {
    if ((df_choice[me_choice,1] == "Rock" & ai_choice == "Scissors") |
        (df_choice[me_choice,1] == "Paper" & ai_choice == "Rock") |
        (df_choice[me_choice,1] == "Scissors" & ai_choice == "Paper")) {
      me_count = me_count + 1
      print("You win !!")
      } else {
        ai_count = ai_count + 1
        print("lol, Sorry you can try again")
      }
    }
  print(df_confirm)
  print("Would you like to try again? :")
	con = readLines("stdin",n = 1)
  if (con == 1) {
    loop = con
  } else {
    print(paste("Your score : ",me_count) )
    print(paste("Ai score : ",ai_count) )
    print(paste("amount of draw : ",draw) )
    print("Thank you for playing.")
    loop = con
  }
} }

game()
