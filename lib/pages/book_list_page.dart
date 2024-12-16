import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/models/book.dart';
import 'package:muras_kitepkanasy/pages/rented_book_page.dart';

class BookListPage extends StatefulWidget {
  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final List<Book> books = [
    Book(
        title: 'Гарри Поттер',
        author: 'Дж. К. Роулинг',
        genre: 'Фэнтези',
        copiesAvailable: 9,
        image: 'assets/images/harrypotter.jpg',
        totalCopies: 9),
    Book(
        title: 'Ак кеме',
        author: 'Ч. Т. Айтматов',
        genre: 'Тарыхий',
        copiesAvailable: 19,
        totalCopies: 19,
        image: 'assets/images/akkeme.jpg'),
    Book(
        title: 'Саманчынын жолу',
        author: 'Ч. Т. Айтматов',
        genre: 'Уламыш',
        copiesAvailable: 15,
        totalCopies: 15,
        image: 'assets/images/samanchynynjolu.jpg'),
    Book(
        title: 'Эрте келген турналар',
        author: 'Ч. Т. Айтматов',
        genre: 'Аңгеме',
        copiesAvailable: 23,
        totalCopies: 23,
        image: 'assets/images/ertekelgent.jpg'),
    Book(
        title: 'Богатый папа и бедный папа',
        author: 'Роберт Кийосаки',
        genre: 'Шыктандыруучу',
        copiesAvailable: 7,
        totalCopies: 7,
        image: 'assets/images/bogatiypapa.jpg'),
    Book(
        title: 'Сынган кылыч',
        author: 'Төлөгөн Касымбеков',
        genre: 'Тарыхий',
        copiesAvailable: 50,
        totalCopies: 50,
        image: 'assets/images/sk.jpg'),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мурас китепканасы'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RentedBookPage(rentedBooks: books),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          final returnCount = book.copiesAvailable + book.totalCopies;
          // setState(() {
          //   final returnCount;
          // });

          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                          width: 200, // Ширина изображения
                          height: 250, // Высота изображения
                          fit: BoxFit
                              .cover, // Растягивает изображение, сохраняя пропорции
                        ),
                      ),
                      SizedBox(
                          width: 16.0), // Отступ между изображением и текстом
                      // Информация о книге
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                                height:
                                    8.0), // Отступ между названием и автором
                            Text(
                              'Автору: ${book.author}\nЖеткиликтүү: $returnCount',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[700],
                              ),
                            ),

                            SizedBox(height: 16.0),
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
                                child: Text(
                                  'Ижарага алуу',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
