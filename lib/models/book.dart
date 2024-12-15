class Book {
  String _title;
  String _author;
  String _genre;
  String _image;
  int _copiesAvailable;
  int _totalCopies;

  // Конструктор
  Book({
    required String title,
    required String author,
    required String genre,
    required int copiesAvailable,
    required String image,
    required int totalCopies,
  })  : _title = title,
        _author = author,
        _genre = genre,
        _image = image,
        _copiesAvailable = copiesAvailable,
        _totalCopies = totalCopies;

  // Геттеры и сеттеры
  String get title => _title;
  set title(String value) => _title = value;

  String get author => _author;
  set author(String value) => _author = value;

  String get genre => _genre;
  set genre(String value) => _genre = value;

  String get image => _image;
  set image(String value) => _image = value;

  int get totalCopies => _totalCopies;
  set totalCopies(int value) => _totalCopies = value;

  int get copiesAvailable => _copiesAvailable;
  set copiesAvailable(int value) {
    if (value >= 0) _copiesAvailable = value;
  }

  // Метод для проверки доступности
  bool isAvailable() => _copiesAvailable > 0;

  // Метод для обновления статуса книги
  void updateCopies(int change) {
    _copiesAvailable += change;
  }

  @override
  String toString() {
    return 'Аты: $_title, Автору: $_author, Жанры: $_genre, Жеткиликтүү көчүрмөлөр: $_copiesAvailable';
  }
}
