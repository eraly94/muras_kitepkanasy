import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мурас китепканасы'),
      ),
      body: Column(
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
                      'assets/images/sk.jpg',
                      width: 200, // Ширина изображения
                      height: 250, // Высота изображения
                      fit: BoxFit
                          .cover, // Растягивает изображение, сохраняя пропорции
                    ),
                  ),
                  SizedBox(width: 16.0), // Отступ между изображением и текстом
                  // Информация о книге
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Китеп: Аккемер',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            height: 8.0), // Отступ между названием и автором
                        Text(
                          'Автор',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Доступно: ',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        InkWell(
                          onTap: () {},
                          child: Text('Ижарага алуу'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
