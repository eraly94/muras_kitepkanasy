import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/models/book.dart';
import 'package:muras_kitepkanasy/pages/book_list_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
        title: 'Богатый и \nбедный папа',
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
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: Text("User Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 150,
                child: Image.asset(
                  'assets/images/avatar.jpeg',
                  // Высота изображения
                  fit: BoxFit
                      .cover, // Растягивает изображение, сохраняя пропорции
                ),
              ),
              SizedBox(height: 5),
              Divider(
                height: 5,
                color: Colors.grey,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Asanov Usen",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Row(
                    
                    children: [
                      Text("phone number: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          )),
                      Text("+79261234567",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Row(
                    
                    children: [
                      Text("id: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          )),
                      Text(
                        "007",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                   
                    children: [
                      Text("мендеги китептердин саны:",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          )),
                      Text(" 4",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),
              Expanded(
                child: MyBooks(books: books),
              )
            ],
          ),
        ));
  }
}

class MyBooks extends StatelessWidget {
  const MyBooks({
    super.key,
    required this.books,
  });

  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:books.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final book = books[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 12.0),
          child: Container(
            padding: const EdgeInsets.all(4),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Изображение книги
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      8.0), // Скругленные углы изображения
                  child: Image.asset(
                  book.image,
                    width: 80, // Ширина изображения
                    height: 100, // Высота изображения
                    fit: BoxFit
                        .cover, // Растягивает изображение, сохраняя пропорции
                  ),
                ),
                SizedBox(
                    width:
                        16.0), // Отступ между изображением и текстом
                // Информация о книге
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Китеп: ',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                        
                         book.title,
                          style: TextStyle(
                            
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                        
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          'Автор:',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          book.author,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
