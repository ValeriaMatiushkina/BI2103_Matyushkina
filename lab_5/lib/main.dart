import 'package:flutter/material.dart';
import 'simple_list.dart';
import 'infinity_list.dart';
import 'infinity_math_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.brown, // Коричневый оттенок
        scaffoldBackgroundColor: Colors.brown[50], // Светлый коричневый фон
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[400], // Более насыщенный коричневый для AppBar
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black87, // Цвет активной вкладки
          unselectedLabelColor: Colors.black54, // Цвет неактивных вкладок
        ),
        listTileTheme: ListTileThemeData(
          textColor: Colors.black87, // Цвет текста в ListTile
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Списки'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Простой'),
                Tab(text: 'Бесконечный'),
                Tab(text: 'Степени 2'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SimpleList(),
              InfinityList(),
              InfinityMathList(),
            ],
          ),
        ),
      ),
    );
  }
}