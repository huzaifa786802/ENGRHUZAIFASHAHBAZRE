#Stock Portfolio Tracker
#● Goal: Build a simple stock tracker that calculates total investment based on manually defined stock prices.
#● Simplified Scope:
#User inputs stock names and quantity.
#Use a hardcoded dictionary to define stock prices (e.g., {"AAPL": 180, "TSLA": 250}).
#Display total investment value and optionally save the result in a .txt or .csv file.
#Key Concepts Used: dictionary, input/output, basic arithmetic, file handling (optional).
#Stock Portfolio Tracker
#Hardcoded stock prices
stock_prices={
    "AAPL":1800,
    "TSLA":2500,
    "GOOGL":28000,
    "AMZN":35000,
    "MSFT":3000
}
#Dictionary to hold user portfolio
portfolio={}
print("Welcome to the Stock Portfolio Tracker!")
print("Available stocks and their prices:")
for stock,price in stock_prices.items():
    print(f"{stock}: ${price}") 
#Input loop
while True:
    stock_name=input("\nEnter stock symbol(or type 'done' to finish): ").upper()
    if stock_name=="DONE":
        break
    if stock_name not in stock_prices:
        print("Stock not in list.Please enter a valid stock symbol.")
        continue
    try:
        quantity=int(input(f"Enter quantity of {stock_name}: "))
        if quantity<0:
            print("Quantity cannot be negative. ")
            continue
        portfolio[stock_name]=portfolio.get(stock_name,0)+quantity
    except ValueError:
        print("Please enter a valid number for quantity.")
#Calculate total investment
total_investment=0
print("\nYour Portfolio Summary:")
print("-----------------------")
for stock,qty in portfolio.items():
    stock_value=stock_prices[stock]*qty
    total_investment+=stock_value
    print(f"{stock}:{qty} shares x ${stock_prices[stock]} = ${stock_value}")
print("-----------------------")
print(f"Total Investment Value: ${total_investment}")
#Optional: Save portfolio  to a textfile
save_option=input("\nDo you want to save your portfolio to a text file? (yes/no): ").lower()
if save_option=="yes":
    with open("portfolio.txt","w") as file:
        file.write("Your Portfolio Summary:\n")
        file.write("-----------------------\n")
        for stock,qty in portfolio.items():
            file.write(f"{stock}:{qty} shares x ${stock_prices[stock]}=${stock_prices[stock]*qty}\n")
            file.write("-----------------------\n")
        file.write(f"Total Investment Value: ${total_investment}\n")
    print("Portfolio saved to 'portfolio.txt' successfully.")