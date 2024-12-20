import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/constants/app_text_styles.dart';
import 'package:muras_kitepkanasy/models/book.dart';

class UserPage extends StatefulWidget {
  final List<Book> rentedBooksUser;
  const UserPage({super.key, required this.rentedBooksUser});

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
        backgroundColor: Colors.grey[500],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Колонуучунун бети",
            style: AppTextStyles.titleLittlef20w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                radius: 100,
                child: Icon(
                  Icons.person,
                  size: 100,
                ),
              ),
              const SizedBox(height: 5),
              const Divider(
                height: 5,
                color: Colors.grey,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Аты-жөнү: ",
                          style: AppTextStyles.f13wb
                              .copyWith(color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: "Асанов Үсөн",
                              style: AppTextStyles.f18wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Телефон номуру:",
                          style: AppTextStyles.f13wb
                              .copyWith(color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: "+79261234567",
                              style: AppTextStyles.f18wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "id:",
                          style: AppTextStyles.f13wb
                              .copyWith(color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: "007",
                              style: AppTextStyles.f18wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "мендеги китептердин саны:",
                          style: AppTextStyles.f13wb
                              .copyWith(color: Colors.grey[700]),
                          children: [
                            TextSpan(
                              text: "${rentedBooksListUser.length}",
                              style: AppTextStyles.f18wb.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
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
