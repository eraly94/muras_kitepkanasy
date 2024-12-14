import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/models/book.dart';

import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/models/book.dart';

class RentedBookPage extends StatelessWidget {
  final List<Book> rentedBooks;

  const RentedBookPage({Key? key, required this.rentedBooks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Фильтруем список для отображения только арендованных книг
    final rentedBooksList = rentedBooks
        .where((book) => book.copiesAvailable < book.totalCopies)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Арендованные книги'),
      ),
      body: rentedBooksList.isEmpty
          ? Center(
              child: Text(
                'Пока вы не арендовали книги.',
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: rentedBooksList.length,
              itemBuilder: (context, index) {
                final book = rentedBooksList[index];
                final rentedCount = book.totalCopies -
                    book.copiesAvailable; // Количество арендованных копий
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 3), // Смещение тени
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Изображение книги
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8.0), // Скругленные углы изображения
                          child: Image.asset(
                            book.image,
                            width: 120, // Ширина изображения
                            height: 180, // Высота изображения
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // Информация о книге
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Автор: ${book.author}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Арендовано копий: $rentedCount',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 16.0),
                              // Кнопка возврата книги
                              ElevatedButton(
                                onPressed: () {
                                  book.updateCopies(1); // Вернуть книгу
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Вы вернули книгу "${book.title}"'),
                                    ),
                                  );
                                  // Перестроить экран
                                  (context as Element).reassemble();
                                },
                                child: Text('Вернуть книгу'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
