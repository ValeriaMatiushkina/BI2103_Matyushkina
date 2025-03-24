import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор площади',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  String _result = '';
  bool _widthError = false;
  bool _heightError = false;

  void _calculateArea() {
    setState(() {
      _widthError = _widthController.text.isEmpty;
      _heightError = _heightController.text.isEmpty;
    });

    if (_widthError || _heightError) {
      return;
    }

    final width = double.tryParse(_widthController.text);
    final height = double.tryParse(_heightController.text);

    if (width == null || height == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, введите корректные числовые значения')),
      );
      return;
    }

    final area = width * height;
    setState(() {
      _result = 'S = $width * $height = $area (мм2)';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Площадь успешно рассчитана')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор площади'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _widthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ширина (мм)',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Задайте ширину',
                hintStyle: TextStyle(color: Colors.grey),
                errorText: _widthError ? 'задайте параметры' : null,
              ),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Высота (мм)',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Задайте высоту',
                hintStyle: TextStyle(color: Colors.grey),
                errorText: _heightError ? 'задайте параметры' : null,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArea,
              child: Text('Вычислить'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}