// ignore_for_file: unnecessary_getters_setters, avoid_print

import 'package:muras_kitepkanasy/models/book.dart';

class User {
  String _name;
  String _id;
  final List<Book> _rentedBooks = [];

  // Конструктор
  User({required String name, required String id})
      : _name = name,
        _id = id;

  // Геттеры и сеттеры
  String get name => _name;
  set name(String value) => _name = value;

  String get id => _id;
  set id(String value) => _id = value;

  List<Book> get rentedBooks => _rentedBooks;

  // Метод для добавления книги в список арендованных
  void rentBook(Book book) {
    if (book.isAvailable()) {
      _rentedBooks.add(book);
      book.updateCopies(-1); // Уменьшаем количество доступных копий
    } else {
      print('Книга "${book.title}" недоступна для аренды.');
    }
  }

  // Метод для возврата книги
  void returnBook(Book book) {
    if (_rentedBooks.contains(book)) {
      _rentedBooks.remove(book);
      book.updateCopies(1); // Увеличиваем количество доступных копий
    } else {
      print('Эта книга не была арендована данным пользователем.');
    }
  }

  @override
  String toString() {
    return 'Пользователь: $_name, ID: $_id, Арендованные книги: ${_rentedBooks.map((b) => b.title).join(", ")}';
  }
}
