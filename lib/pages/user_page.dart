import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/models/book.dart';

class UserPage extends StatefulWidget {
  final List<Book> rentedBooksUser;
  const UserPage({Key? key, required this.rentedBooksUser}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    // Фильтруем список для отображения только арендованных книг
    final rentedBooksListUser = widget.rentedBooksUser
        .where((book) => book.copiesAvailable < book.totalCopies)
        .toList();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          centerTitle: true,
          title: const Text("User Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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
              const SizedBox(height: 5),
              const Divider(
                height: 5,
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Asanov Usen",
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
                      const Text("+79261234567",
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
                      const Text(
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
                      Text("мендеги китептердин саны: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          )),
                      Text(
                          "${rentedBooksListUser.length}", // Количество арендованных копий
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: MyBooks(
                  books: rentedBooksListUser,
                ),
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
    return books.isEmpty
        ? Center(
            child: Text('Ижарага алынган китеп жок.',
                style: AppTextStyles.f16.copyWith(color: Colors.grey)),
          )
        : ListView.builder(
            itemCount: books.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {

              final book = books[index];
               
                final rentedCount = book.totalCopies -
                    book.copiesAvailable; // Количество арендованных копий
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset:const  Offset(0, 3), // Смещение тени
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
                     const SizedBox(
                          width: 16.0), // Отступ между изображением и текстом
                      // Информация о книге
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(
                                'Автор: ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                book.author,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Text(
                                'Ижарага алынган копиясы: ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                 '$rentedCount',
                                style: const TextStyle(
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
