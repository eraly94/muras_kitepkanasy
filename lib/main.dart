import 'package:flutter/material.dart';
import 'package:muras_kitepkanasy/pages/book_list_page.dart';
import 'package:muras_kitepkanasy/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const SignUpPage(),

      //home: BookListPage(),
      // home: SignUpPage(),
      // home:UserPage(),
    );
  }
}
