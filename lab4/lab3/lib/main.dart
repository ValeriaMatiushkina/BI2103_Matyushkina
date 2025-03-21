import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LibraryPage(),
    );
  }
}

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _count = 10;
  bool _isLiked = false;

  void liked() {
    setState(() {
      if (!_isLiked) {
        _count++;
      } else {
        _count--;
      }
      _isLiked = !_isLiked;
    });
  }

  void _call() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Позвонить в библиотеку')),
    );
  }

  void _showRoute() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Показать маршрут до библиотеки')),
    );
  }

  void _share() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Поделиться информацией о библиотеке')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Общественная библиотека'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://media.istockphoto.com/id/949118068/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BD%D0%B8%D0%B3%D0%B8.jpg?s=612x612&w=0&k=20&c=qCT40cW1o_fdP422mdDHd_wJh1OdGYBrEfjrfGdCius=',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Книжный клуб',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Краснодар, ул. Генерала Шифрина, 1',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      FloatingActionButton(
                        onPressed: liked,
                        child: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text('$_count'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: _call,
                        child: Column(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.black54,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'ПОЗВОНИТЬ',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: _showRoute,
                        child: Column(
                          children: [
                            Icon(
                              Icons.map,
                              color: Colors.black54,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'МАРШРУТ',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: _share,
                        child: Column(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.black54,
                            ),
                            SizedBox(height: 4),
                            Text(
                              'ПОДЕЛИТЬСЯ',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Добро пожаловать в нашу общественную библиотеку! Наша библиотека — это не просто место, где можно взять книги на время. Это уютное пространство, где каждый может найти вдохновение, знания и новых друзей. Мы гордимся тем, что являемся центром культурной жизни нашего сообщества, предлагая разнообразные ресурсы и мероприятия для всех возрастов.',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Image.network(
                    'https://media.istockphoto.com/id/1453081662/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BD%D0%B8%D0%B6%D0%BD%D1%8B%D0%B9-%D0%BC%D0%B0%D0%B3%D0%B0%D0%B7%D0%B8%D0%BD-%D0%B2-%D1%86%D0%B5%D0%BD%D1%82%D1%80%D0%B5-%D0%BB%D0%B8%D1%81%D1%81%D0%B0%D0%B1%D0%BE%D0%BD%D0%B0.jpg?s=612x612&w=0&k=20&c=mUc9HVSShVLQtWPg-EzPUU4HC0uCpGEOIhmVen4lGGI=',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Одной из наших самых популярных инициатив является книжный клуб, который собирает любителей литературы в дружеской атмосфере. Каждый месяц мы выбираем новую книгу для обсуждения, охватывающую различные жанры и темы — от классической литературы до современных бестселлеров . Участники клуба имеют возможность делиться своими мыслями, анализировать произведения и открывать для себя новых авторов.',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}