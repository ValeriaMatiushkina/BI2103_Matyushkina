import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../coffee_machine_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final coffeeState = Provider.of<CoffeeMachineState>(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                      'Состояние',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text('Контейнер: ${coffeeState.wasteContainerFull ? 'Полный' : 'Неполный'}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                coffeeState.cleanWasteContainer();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Контейнер очищен!')),
                );
              },
              child: const Text('Очистить контейнер'),
            ),
            const SizedBox(height: 10),
             ElevatedButton(
              onPressed: () {
                coffeeState.resetResources();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ресурсы пополнены!')),
                );
              },
              child: const Text('Пополнить ресурсы'),
            ),
          ],
        ),
      ),
    );
  }
}