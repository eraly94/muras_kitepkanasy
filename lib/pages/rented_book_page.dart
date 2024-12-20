import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/models/book.dart';

class RentedBookPage extends StatefulWidget {
  final List<Book> rentedBooks;

  const RentedBookPage({super.key, required this.rentedBooks});

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
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: const Text('Ижарага алынган китептердин\n тизмеси',
            style: AppTextStyles.titleLittlef20w700,
            textAlign: TextAlign.center),
      ),
      body: rentedBooksList.isEmpty
          ? Center(
              child: Text('Ижарага алынган китеп жок.',
                  style: AppTextStyles.f16.copyWith(color: Colors.grey)),
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
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 23, 16, 220).withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(5, 5), // Смещение тени
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
                                style: AppTextStyles.f14.copyWith(
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text('Ижарага алынган копиясы: $rentedCount',
                                  style: AppTextStyles.f14
                                      .copyWith(color: Colors.grey[700])),
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
                                child: Text(
                                  'Китепти кайтаруу',
                                  style: AppTextStyles.f13wb.copyWith(
                                      color: Color.fromARGB(255, 139, 54, 147)),
                                ),
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
