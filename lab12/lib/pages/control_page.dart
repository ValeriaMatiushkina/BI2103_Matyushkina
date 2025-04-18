import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../coffee_machine_state.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});
void _showFeedback(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final coffeeState = Provider.of<CoffeeMachineState>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Дисплей ресурсов
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Ресурсы',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text('Вода: ${coffeeState.waterLevel}%'),
                    const SizedBox(height: 10),
                    Text('Зерна: ${coffeeState.coffeeBeans}%'),
                    const SizedBox(height: 10),
                    Text('Молоко: ${coffeeState.milkLevel}%'),
                    const SizedBox(height: 10),
                    Text('Отходы: ${coffeeState.wasteContainerFull ? 'Полный' : 'Неполный'}')
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Кнопки управления
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        try {
                          coffeeState.makeCoffee('Эспрессо');
                          _showFeedback(context, 'Эспрессо готовится...');
                          Future.delayed(const Duration(seconds: 5), () {
                            _showFeedback(context, 'Эспрессо готов!');
                          });
                        } catch (e) {
                          _showFeedback(context, 'Ошибка: ${e.toString()}');
                        }
                      },
                      child: const Text('Приготовить Эспрессо'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        try {
                          coffeeState.makeCoffee('Капучино');
                          _showFeedback(context, 'Капучино готовится...');
                          Future.delayed(const Duration(seconds: 5), () {
                            _showFeedback(context, 'Капучино готов!');
                          });
                        } catch (e) {
                          _showFeedback(context, 'Ошибка: ${e.toString()}');
                        }
                      },
                      child: const Text('Приготовить Капучино'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        try {
                          coffeeState.makeCoffee('Латте');
                          _showFeedback(context, 'Латте готовится...');
                          Future.delayed(const Duration(seconds: 5), () {
                            _showFeedback(context, 'Латте готов!');
                          });
                        } catch (e) {
                          _showFeedback(context, 'Ошибка: ${e.toString()}');
                        }
                      },
                      child: const Text('Приготовить Латте'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}