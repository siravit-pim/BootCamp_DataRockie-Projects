## Play this >> https://replit.com/@zkiddy/Chatbotpizza#main.r

# chat bot order the pizza (use function "pizza_Chat()")

## detail about question, chat_box
pick = c("Take-out","Delivery")
df_pick = data.frame(pick)

addr = c("A house","An apartment","An office")
df_addr = data.frame(adress = addr)

menu = c("Margherita","Hawaiian","Vegetarian","Anchovy and Olives","Meat Feast","Pepperoni","BBQ Chicken","Smoked Salmon")
price1 = c(99,99,79,89,99,99,99,109)
df_topping = data.frame(menu,price = price1)

size = c("Large","Medium","Small")
price2 = c(39,29,0)
df_size = data.frame(size,price = price2)

crust = c("Pan","Crispy thin")
df_crust = data.frame(crust)

choice = c("Yes","No")
price3 = c(15,0)
df_choice = data.frame(choice)  
df_choice2 = data.frame(choice,price = price3)

extra = c("add","non")
df_extra = data.frame(extra_Chess = extra)

amounts = 0
costs = 0
confirm = "1"

pizza_chat = function() {
  print("Kiddy Pizza. How can i help you? : ")
  chat_1 = readLines("stdin",n = 1)
  print(df_pick)
  print("Is this for? : ")
  chat_2 = readLines("stdin",n = 1)
  print("Can I have your address please? : ")
  chat_3 = readLines("stdin",n = 1)
  print(df_addr)
  print("Is that? : ")
  chat_4 = readLines("stdin",n = 1)
  print("*** Plese press 'Number' for informaion ***")
  
  while (confirm == "1") {
    print(df_topping)
    print("What would you like to toppings? :")
    chat_5 = as.numeric(readLines("stdin",n = 1) )
    cost1 = df_topping[chat_5,2] 
    print(df_size)
    print("Would you like to size? : ")
    chat_6 = as.numeric(readLines("stdin",n = 1) )
    cost2 = df_size[chat_6,2] 
    print(df_crust)
    print("Would you like the crust pizza? : ")
    chat_7 = readLines("stdin",n = 1) 
    print(df_choice2)
    print("And Would you like to extra cheese? : ")
    chat_8 = as.numeric(readLines("stdin",n = 1) )
    cost3 = df_choice2[chat_8,2] 
    
    # calculate amount of the pizza
    print("How many do you want? :")
    amount = as.numeric(readLines("stdin",n = 1))
    # calculate cost of the order
    cost = amount * ( cost1 + cost2 + cost3 )
    
    print(paste("The pizza topping",df_topping[chat_5,1],",",df_size[chat_6,1],",",df_crust[chat_7,1],"and",df_extra[chat_8,1],"extra cheese"))
    
    print(df_choice)
    print("Confirm your menu? : ")
    chat_9 = readLines("stdin",n = 1)
    if (chat_9 == "2") { 
      print(df_choice)
      print("Confirm your menu? : ")
      chat_10 = readLines("stdin",n = 1)
      if (chat_10 == "1") {
        confirm = chat_10
      } else {
        print("Okey, good bye.")
        break
      }
    } else {
      # collect order and amount
      amounts = amounts + amount
      costs = costs + cost
      print(df_choice)
      print("Add more another pizza? :")
      chat_11 = readLines("stdin",n = 1)
      if (chat_11 == "1") {
        confirm = chat_11
      } else {
        print(paste("Totally",costs,"$","amount",amounts,"tray,","Please provide money to pay."))
        print("Thanks for ordered. Please waiting about thirty minutes. Bye.")
        confirm = chat_11
      }
    }
  } 
}

pizza_chat()
