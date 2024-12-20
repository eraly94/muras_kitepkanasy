import 'package:muras_kitepkanasy/models/book.dart';
import 'package:muras_kitepkanasy/models/user.dart';

class Rental {
  final Book _book;
  final User _user;
  final DateTime _rentalDate;
  DateTime? _returnDate;

  // Конструктор
  Rental({required Book book, required User user})
      : _book = book,
        _user = user,
        _rentalDate = DateTime.now();

  // Геттеры
  Book get book => _book;
  User get user => _user;
  DateTime get rentalDate => _rentalDate;
  DateTime? get returnDate => _returnDate;

  // Метод для завершения аренды (возврат книги)
  void returnRental() {
    _returnDate = DateTime.now();
    _user.returnBook(_book);
    // ignore: avoid_print
    print(
        'Книга "${_book.title}" была возвращена пользователем ${_user.name}.');
  }

  @override
  String toString() {
    return 'Аренда: Книга - ${_book.title}, Пользователь - ${_user.name}, Дата аренды: $_rentalDate, Дата возврата: ${_returnDate ?? "не возвращена"}';
  }
}
