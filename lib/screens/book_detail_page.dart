import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_bloc.dart';
import '../bloc/book_event.dart';
import '../models/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Detail"),
        backgroundColor: Colors.pink[50],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.read<BookBloc>().add(GoBackToList()),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.imageUrl, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(book.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(book.author, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            Text(book.description, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}