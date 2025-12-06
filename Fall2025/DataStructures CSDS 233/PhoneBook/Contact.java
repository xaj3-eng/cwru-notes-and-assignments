public class Contact {
  private String name;
  private String number;
  private String address;

  public Contact(String name, String number, String address) {
    this.name = name;
    this.number = number;
    this.address = address;
  }

  public String getName() { return name; }
  public void setName(String name) { this.name = name; }
}
