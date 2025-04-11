import 'package:flutter/material.dart';

class CoffeeMachineState extends ChangeNotifier {
  int _waterLevel = 75;
  int _coffeeBeans = 50;
  int _milkLevel = 60;
  bool _wasteContainerFull = false;
  int wasteContainer = 0;

  // Геттеры
  int get waterLevel => _waterLevel;
  int get coffeeBeans => _coffeeBeans;
  int get milkLevel => _milkLevel;
  bool get wasteContainerFull => _wasteContainerFull;

  // Приготовление кофе
  void makeCoffee(String coffeeType) {
    if (_waterLevel < 10 || _coffeeBeans < 10 || (coffeeType != 'Эспрессо' && _milkLevel < 15)) {
      throw Exception('Недостаточно ресурсов');
    }
     if (wasteContainer == 50) {
      throw Exception('Контейнер заполнен');
    }

    _waterLevel -= 10;
    _coffeeBeans -= 10;
    wasteContainer += 10;

    if (coffeeType == 'Капучино' || coffeeType == 'Латте') {
      _milkLevel -= 15;
    }

    // 20% шанс заполнить контейнер
    if (wasteContainer == 50) {
      _wasteContainerFull = true;
    }

    notifyListeners(); // Уведомляем виджеты об изменении
  }

  // Очистка контейнера
  void cleanWasteContainer() {
    wasteContainer = 0;
    _wasteContainerFull = false;
    notifyListeners();
  }

  // Сброс всех ресурсов (опционально)
  void resetResources() {
    _waterLevel = 75;
    _coffeeBeans = 60;
    _milkLevel = 60;
    _wasteContainerFull = false;
    wasteContainer = 0;
    notifyListeners();
  }
}