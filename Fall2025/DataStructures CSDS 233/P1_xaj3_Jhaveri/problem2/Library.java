import java.util.ArrayList;

public class Library {
  private ArrayList<Book> books;

  public Library() {
    this.books = new ArrayList<Book>();
  }

  public void addBook(Book book) {
    books.add(book);
  }

  public void removeBook(String isbn) {
    books.removeIf(book -> book.getDetails().contains("isbn: " + isbn));
  }

  public void printBooks() {
    for (Book book : books) {
      System.out.println(book.getDetails());
    }
  }
}
