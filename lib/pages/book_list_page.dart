// ignore_for_file: empty_statements

import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/models/book.dart';
import 'package:muras_kitepkanasy/pages/rented_book_page.dart';
import 'package:muras_kitepkanasy/pages/user_page.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Book> books = [
    Book(
        title: 'Гарри Поттер',
        author: 'Дж. К. Роулинг',
        genre: 'Фэнтези',
        copiesAvailable: 5,
        image: 'assets/images/harrypotter.jpg',
        totalCopies: 5),
    Book(
        title: 'Ак кеме',
        author: 'Ч. Т. Айтматов',
        genre: 'Тарыхий',
        copiesAvailable: 4,
        totalCopies: 4,
        image: 'assets/images/akkeme.jpg'),
    Book(
        title: 'Сынган кылыч',
        author: 'Төлөгөн Касымбеков',
        genre: 'Тарыхий',
        copiesAvailable: 5,
        totalCopies: 5,
        image: 'assets/images/sk.jpg'),
    Book(
        title: 'Саманчынын жолу',
        author: 'Ч. Т. Айтматов',
        genre: 'Уламыш',
        copiesAvailable: 3,
        totalCopies: 3,
        image: 'assets/images/samanchynynjolu.jpg'),
    Book(
        title: 'Богатый папа и бедный папа',
        author: 'Роберт Кийосаки',
        genre: 'Шыктандыруучу',
        copiesAvailable: 7,
        totalCopies: 7,
        image: 'assets/images/bogatiypapa.jpg'),
    Book(
        title: 'Эрте келген турналар',
        author: 'Ч. Т. Айтматов',
        genre: 'Аңгеме',
        copiesAvailable: 2,
        totalCopies: 2,
        image: 'assets/images/ertekelgent.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(rentedBooksUser: books),
                ),
              );
              if (result != null) {
                setState(() {});
              }
            }
            ;
          },
          icon: Icon(
            Icons.person_2,
            color: Color.fromARGB(255, 23, 16, 220).withOpacity(0.5),
            size: 30,
          ),
        ),
        title:
            Text('Мурас китепканасы', style: AppTextStyles.titleLargef28w700),
        actions: [
          IconButton(
            icon: Icon(
              Icons.list_rounded,
              color: Color.fromARGB(255, 23, 16, 220).withOpacity(0.5),
              size: 30,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RentedBookPage(rentedBooks: books),
                ),
              );
              if (result != null) {
                setState(() {});
              }
              ;
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          // final returnCount = book.copiesAvailable + book.totalCopies;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
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
                            15.0), // Скругленные углы изображения
                        child: Image.asset(
                          book.image,
                          width: 200, // Ширина изображения
                          height: 250, // Высота изображения
                          fit: BoxFit
                              .contain, // Растягивает изображение, сохраняя пропорции
                        ),
                      ),
                      const SizedBox(
                          width: 16.0), // Отступ между изображением и текстом
                      // Информация о книге
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(book.title, style: AppTextStyles.f18wb),

                            const SizedBox(
                                height:
                                    8.0), // Отступ между названием и автором
                            Text(
                                'Автору: ${book.author}\nЖеткиликтүү: ${book.copiesAvailable}\nЖанры: ${book.genre}',
                                style: AppTextStyles.f14
                                    .copyWith(color: Colors.grey[700])),

                            const SizedBox(height: 16.0),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: ElevatedButton(
                                onPressed: book.isAvailable()
                                    ? () {
                                        setState(() {
                                          book.updateCopies(-1);
                                        });
                                        // Обработчик аренды книги

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'Сиз "${book.title}" китебин ижарага алдыңыз')),
                                        );
                                      }
                                    : null,
                                child: Text('Ижарага алуу',
                                    style: AppTextStyles.f13wb.copyWith(
                                      color: Color.fromARGB(255, 139, 54, 147),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
