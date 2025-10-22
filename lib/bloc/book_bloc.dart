import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookListState([])) {
    on<LoadBooks>(_onLoadBooks);
    on<SortByAuthor>(_onSortByAuthor);
    on<SortByTitle>(_onSortByTitle);
    on<ShowDetail>(_onShowDetail);
    on<GoBackToList>(_onGoBack);
  }

  void _onLoadBooks(LoadBooks event, Emitter<BookState> emit) {
    final books = [
      Book(
        title: "A Clockwork Orange",
        author: "Anthony Burgess",
        description: "A dystopian novel exploring free will and violence.",
        imageUrl: "https://picsum.photos/200/300?1",
      ),
      Book(
        title: "Don't Look Back",
        author: "Isaac Nelson",
        description: "A gripping thriller about past secrets.",
        imageUrl: "https://picsum.photos/200/300?2",
      ),
      Book(
        title: "Little Gods",
        author: "Meng Jin",
        description: "A lyrical story about identity and migration.",
        imageUrl: "https://picsum.photos/200/300?3",
      ),
      Book(
        title: "James and the Giant Peach",
        author: "Roald Dahl",
        description: "A boy travels in a giant peach with talking insects.",
        imageUrl: "https://picsum.photos/200/300?4",
      ),
      Book(
        title: "The Summer of Grief",
        author: "Clare Grit",
        description: "A tale of loss and rediscovery.",
        imageUrl: "https://picsum.photos/200/300?5",
      ),
    ];

    books.sort((a, b) => a.author.compareTo(b.author));
    emit(BookListState(books, sortByAuthor: true));
  }

  void _onSortByAuthor(SortByAuthor event, Emitter<BookState> emit) {
    if (state is BookListState) {
      final books = List<Book>.from((state as BookListState).books);
      books.sort((a, b) => a.author.compareTo(b.author));
      emit(BookListState(books, sortByAuthor: true));
    }
  }

  void _onSortByTitle(SortByTitle event, Emitter<BookState> emit) {
    if (state is BookListState) {
      final books = List<Book>.from((state as BookListState).books);
      books.sort((a, b) => a.title.compareTo(b.title));
      emit(BookListState(books, sortByAuthor: false));
    }
  }

  void _onShowDetail(ShowDetail event, Emitter<BookState> emit) {
    emit(BookDetailState(event.book));
  }

  void _onGoBack(GoBackToList event, Emitter<BookState> emit) {
    add(LoadBooks());
  }
}