import '../models/book.dart';

abstract class BookState {}

class BookListState extends BookState {
  final List<Book> books;
  final bool sortByAuthor; // true = by author, false = by title
  BookListState(this.books, {this.sortByAuthor = true});
}

class BookDetailState extends BookState {
  final Book book;
  BookDetailState(this.book);
}
