package model;

public class Order {
    private boolean set1;
    private boolean set2;
    private String drink1;
    private String drink2;
    private int set1Quantity;
    private int set2Quantity;

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
}
