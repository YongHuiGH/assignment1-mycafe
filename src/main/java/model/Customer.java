package model;

public class Customer {
    private String fullname;
    private int age;
    private String address;
    private String membership; // e.g., "Gold" or "None"
    
    private int quantity;       // number of items ordered
    private double pricePerItem = 50.0; // default price per item

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getMembership() { return membership; }
    public void setMembership(String membership) { this.membership = membership; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPricePerItem() { return pricePerItem; }
    public void setPricePerItem(double pricePerItem) { this.pricePerItem = pricePerItem; }

    public double calculateTotal() {
        return quantity * pricePerItem;
    }

    public double calculateFinalAmount() {
        double total = calculateTotal();
        if (age >= 55) total *= 0.95;          // 5% senior discount
        if ("Gold".equalsIgnoreCase(membership)) total *= 0.90; // 10% gold membership discount
        return total;
    }
}
