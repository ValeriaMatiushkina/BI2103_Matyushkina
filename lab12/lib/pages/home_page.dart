import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../coffee_machine_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeMachineState>(
      builder: (context, coffeeState, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Статус Ресурсов',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text('Уровень воды: ${coffeeState.waterLevel}%'),
                        const SizedBox(height: 10),
                        Text('Кофейные зерна: ${coffeeState.coffeeBeans}%'),
                        const SizedBox(height: 10),
                        Text('Молоко: ${coffeeState.milkLevel}%'),
                        const SizedBox(height: 10),
                        Text('Контейнер для отходов: ${coffeeState.wasteContainerFull ? 'Полный' : 'Неполный'}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Быстрые действия',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}