import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_bloc.dart';
import '../bloc/book_event.dart';
import '../bloc/book_state.dart';
import '../widgets/book_card.dart';
import 'book_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookListState) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.menu),
              title: const Text("Book Club Home"),
              backgroundColor: Colors.pink[50],
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("Sort by", style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          minimumSize: const Size(0, 0),
                          backgroundColor: state.sortByAuthor
                              ? Colors.pink[50]
                              : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () =>
                            context.read<BookBloc>().add(SortByAuthor()),
                        child: const Text("Author"),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          minimumSize: const Size(0, 0),
                          backgroundColor: !state.sortByAuthor
                              ? Colors.pink[50]
                              : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () =>
                            context.read<BookBloc>().add(SortByTitle()),
                        child: const Text("Title"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Books",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.books.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final book = state.books[index];
                        return BookCard(
                          book: book,
                          onTap: () =>
                              context.read<BookBloc>().add(ShowDetail(book)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is BookDetailState) {
          return BookDetailPage(book: state.book);
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
