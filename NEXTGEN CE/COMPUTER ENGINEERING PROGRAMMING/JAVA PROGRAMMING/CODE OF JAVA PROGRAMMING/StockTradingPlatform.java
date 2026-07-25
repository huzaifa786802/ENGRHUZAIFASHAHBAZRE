/*Stock Trading Platform 
*Simulate a basic stock trading environment
*Add features for market data display and buy/sell operations.
*Allow users to track portfolio performance over time.
*Use Object-Oriented Programming (OOP) to manage stocks, users, and transactions.
*Optionally, include file I/O or database to persist portfolio data.
*/
import java.io.*;
import java.util.*;
// Stock class
class Stock {
    private String symbol;
    private double price;
    public Stock(String symbol, double price) {
        this.symbol = symbol;
        this.price = price;
    }
    public String getSymbol() {
        return symbol;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
}
// Transaction class
class Transaction {
    String stockSymbol;
    int quantity;
    double price;
    String type;
    Date date;
    public Transaction(String stockSymbol, int quantity, double price, String type) {
        this.stockSymbol = stockSymbol;
        this.quantity = quantity;
        this.price = price;
        this.type = type;
        this.date = new Date();
    }
    @Override
    public String toString() {
        return type + " " + quantity + " of " + stockSymbol + " at " + price + " on " + date;
    }
}
// Portfolio class
class Portfolio implements Serializable {
    private Map<String, Integer> holdings = new HashMap<>();
    private List<Transaction> transactions = new ArrayList<>();
    public void buyStock(Stock stock, int quantity) {
        holdings.put(stock.getSymbol(),
                holdings.getOrDefault(stock.getSymbol(), 0) + quantity);
        transactions.add(new Transaction(stock.getSymbol(), quantity, stock.getPrice(), "BUY"));
    }
    public void sellStock(Stock stock, int quantity) {
        int owned = holdings.getOrDefault(stock.getSymbol(), 0);
        if (owned >= quantity) {
            holdings.put(stock.getSymbol(), owned - quantity);
            transactions.add(new Transaction(stock.getSymbol(), quantity, stock.getPrice(), "SELL"));
        } else {
            System.out.println("❌ Not enough shares to sell.");
        }
    }
    public void displayPortfolio(Map<String, Stock> market) {
        double totalValue = 0;
        System.out.println("\n📊 Portfolio Summary:");
        for (String symbol : holdings.keySet()) {
            int qty = holdings.get(symbol);
            double price = market.get(symbol).getPrice();
            double value = qty * price;
            totalValue += value;
            System.out.println(symbol + " | Quantity: " + qty + " | Value: " + value);
        }
        System.out.println("Total Portfolio Value: " + totalValue);
    }
    public void showTransactions() {
        System.out.println("\n📜 Transaction History:");
        for (Transaction t : transactions) {
            System.out.println(t);
        }
    }
}
// User class
class User implements Serializable {
    String name;
    Portfolio portfolio = new Portfolio();
    public User(String name) {
        this.name = name;
    }
}
// Market class
class Market {
    Map<String, Stock> stocks = new HashMap<>();
    public Market() {
        stocks.put("AAPL", new Stock("AAPL", 175.5));
        stocks.put("GOOG", new Stock("GOOG", 2800.0));
        stocks.put("MSFT", new Stock("MSFT", 330.0));
    }
    public void displayMarket() {
        System.out.println("\n📈 Market Data:");
        for (Stock s : stocks.values()) {
            System.out.println(s.getSymbol() + " : $" + s.getPrice());
        }
    }
}
// Main class
public class StockTradingPlatform 
{
    static final String FILE_NAME = "portfolio.dat";
    public static void saveUser(User user) {
        try (ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(FILE_NAME))) {
            oos.writeObject(user);
        } catch (IOException e) {
            System.out.println("Error saving portfolio.");
        }
    }
    public static User loadUser() {
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(FILE_NAME))) {
            return (User) ois.readObject();
        } catch (Exception e) {
            return null;
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Market market = new Market();
        User user = loadUser();
        if (user == null) {
            System.out.print("Enter user name: ");
            user = new User(sc.nextLine());
        }
        int choice;
        do {
            System.out.println("\n1. View Market");
            System.out.println("2. Buy Stock");
            System.out.println("3. Sell Stock");
            System.out.println("4. View Portfolio");
            System.out.println("5. View Transactions");
            System.out.println("6. Save & Exit");
            System.out.print("Choose option: ");
            choice = sc.nextInt();
            switch (choice) {
                case 1:
                    market.displayMarket();
                    break;

                case 2:
                    System.out.print("Enter stock symbol: ");
                    String buySym = sc.next();
                    System.out.print("Enter quantity: ");
                    int buyQty = sc.nextInt();
                    user.portfolio.buyStock(market.stocks.get(buySym), buyQty);
                    break;

                case 3:
                    System.out.print("Enter stock symbol: ");
                    String sellSym = sc.next();
                    System.out.print("Enter quantity: ");
                    int sellQty = sc.nextInt();
                    user.portfolio.sellStock(market.stocks.get(sellSym), sellQty);
                    break;

                case 4:
                    user.portfolio.displayPortfolio(market.stocks);
                    break;

                case 5:
                    user.portfolio.showTransactions();
                    break;

                case 6:
                    saveUser(user);
                    System.out.println("💾 Portfolio saved. Exiting...");
                    break;
            }
        } while (choice != 6);
        sc.close();
    }
}