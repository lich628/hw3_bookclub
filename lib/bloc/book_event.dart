import '../models/book.dart';

abstract class BookEvent {}

class LoadBooks extends BookEvent {}

class SortByAuthor extends BookEvent {}

class SortByTitle extends BookEvent {}

class ShowDetail extends BookEvent {
  final Book book;
  ShowDetail(this.book);
}

class GoBackToList extends BookEvent {}
