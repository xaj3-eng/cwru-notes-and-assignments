public class TestLibrary {
  public static void main(String[] args) {
    System.out.println("\nProblem 2:");

    // Instantiate a Library
    Library library = new Library();

    // Creating several Book objects
    Book book1 = new Book("Book Number 1", "Xander Jhaveri", "923458");
    Book book2 = new Book("Book 2", "Erman Ayday", "293843");
    Book book3 = new Book("Awesome Book 3", "Anonymous", "329847");

    // Adding the books above to the library
    library.addBook(book1);
    library.addBook(book2);
    library.addBook(book3);

    // Printing all books
    System.out.println("All Books:");
    library.printBooks();

    // Removing a book from the library by its ISBN
    library.removeBook("329847");

    // Printing all books after removal
    System.out.println("\nBooks after removing ISBN 329847:");
    library.printBooks();
  }
}
