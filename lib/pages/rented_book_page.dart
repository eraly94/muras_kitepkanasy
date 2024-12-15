import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/models/book.dart';

class RentedBookPage extends StatefulWidget {
  final List<Book> rentedBooks;

  const RentedBookPage({Key? key, required this.rentedBooks}) : super(key: key);

  @override
  State<RentedBookPage> createState() => _RentedBookPageState();
}

class _RentedBookPageState extends State<RentedBookPage> {
  @override
  Widget build(BuildContext context) {
    // Фильтруем список для отображения только арендованных книг
    final rentedBooksList = widget.rentedBooks
        .where((book) => book.copiesAvailable < book.totalCopies)
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        title: const Text(
          'Ижарага алынган китептердин тизмеси',
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
      ),
      body: rentedBooksList.isEmpty
          ? const Center(
              child: Text(
                'Ижарага алынган китеп жок.',
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
                          offset: const Offset(0, 3), // Смещение тени
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
                        const SizedBox(width: 16.0),
                        // Информация о книге
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Автору: ${book.author}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Ижарага алынган копиясы: $rentedCount',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              // Кнопка возврата книги
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    book.updateCopies(1);
                                    // Вернуть книгу
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Сиз "${book.title}" китебин кайтардыңыз'),
                                    ),
                                  );
                                },
                                child: const Text('Китепти кайтаруу'),
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
