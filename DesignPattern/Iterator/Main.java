import java.util.Iterator;
import java.util.NoSuchElementException;

public class Main {
  public static void main(String[] args) {
    BookShelf bookShelf = new BookShelf(4);
    bookShelf.appendBook(new Book("Around the World in 80 days"));
    bookShelf.appendBook(new Book("Bible"));
    bookShelf.appendBook(new Book("Cinderlla"));
    bookShelf.appendBook(new Book("Daddy-Long-Legs"));

    // 明示的な Iterator
    Iterator<Book> it = bookShelf.iterator();
    while (it.hasNext()) {
      Book book = it.next();
      System.out.println(book.getName());
    }
    System.out.println();

    // 拡張for
    for (Book book : bookShelf) {
      System.out.println(book.getName());
    }
    System.out.println();
  }
}

public class Book {
  private String name;

  public Book(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }
}

public class BookShelf implements Iterable<Book> {
  private Book[] books;
  private int last = 0;

  public BookShelf(int maxsize) {
    this.books = new Book[maxsize];
  }

  public Book getBookAt(int index) {
    return books[index];
  }

  public void appendBook(Book book) {
    this.books[last] = book;
    last++;
  }

  public int getLength() {
    return last;
  }

  public Iterator<Book> iterator() {
    return new BookShelfIterator(this);
  }
}

public class BookShelfIterator implements Iterator<Book> {
  private BookShelf bookShelf;
  private int index;

  public BookShelfIterator(BookShelf bookShelf) {
    this.bookShelf = bookShelf;
    this.index = 0;
  }

  @Override
  public boolean hasNext() {
    if (index < bookShelf.getLength()) {
      return true;
    } else {
      return false;
    }
  }

  @Override
  public Book next() {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    Book book = bookShelf.getBookAt(index);
    index++;
    return book;
  }
}
