package model;

public class Order {
    private boolean set1;
    private boolean set2;
    private String drink1;
    private String drink2;
    private int set1Quantity;
    private int set2Quantity;

    // Price mapping for sets and drinks
    private static final double PRICE_SET1_COFFEE = 10.00;
    private static final double PRICE_SET1_MILO = 13.00;
    private static final double PRICE_SET2_COFFEE = 11.00;
    private static final double PRICE_SET2_MILO = 15.00;
    private static final double PRICE_SET2_LEMON_TEA = 12.00;

    public Order() {}

    // getters and setters
    public boolean isSet1() { return set1; }
    public void setSet1(boolean set1) { this.set1 = set1; }

    public boolean isSet2() { return set2; }
    public void setSet2(boolean set2) { this.set2 = set2; }

    public String getDrink1() { return drink1; }
    public void setDrink1(String drink1) { this.drink1 = drink1; }

    public String getDrink2() { return drink2; }
    public void setDrink2(String drink2) { this.drink2 = drink2; }

    public int getSet1Quantity() { return set1Quantity; }
    public void setSet1Quantity(int set1Quantity) { this.set1Quantity = set1Quantity; }

    public int getSet2Quantity() { return set2Quantity; }
    public void setSet2Quantity(int set2Quantity) { this.set2Quantity = set2Quantity; }

    // Get price per item based on set and drink
    public double getPricePerItem() {
        // This is a simplified version - in reality you'd calculate based on set and drink
        return 10.00;
    }

    // Calculate total price before discount
    public double calculateTotal() {
        double total = 0;
        if (set1) {
            double set1Price = "coffee".equalsIgnoreCase(drink1) ? PRICE_SET1_COFFEE : PRICE_SET1_MILO;
            total += set1Price * set1Quantity;
        }
        if (set2) {
            double set2Price;
            if ("coffee".equalsIgnoreCase(drink2)) {
                set2Price = PRICE_SET2_COFFEE;
            } else if ("milo".equalsIgnoreCase(drink2)) {
                set2Price = PRICE_SET2_MILO;
            } else {
                set2Price = PRICE_SET2_LEMON_TEA;
            }
            total += set2Price * set2Quantity;
        }
        return total;
    }

    // Calculate final amount with discounts
    public double calculateFinalAmount(model.Customer customer) {
        double total = calculateTotal();
        
        // Senior discount (age >= 55)
        if (customer.getAge() >= 55) {
            total *= 0.95;  // 5% discount
        }
        
        // Gold membership discount
        if ("yes".equalsIgnoreCase(customer.getMembership())) {
            total *= 0.90;  // 10% discount
        }
        
        return Math.round(total * 100.0) / 100.0;  // Round to 2 decimal places
    }
}
