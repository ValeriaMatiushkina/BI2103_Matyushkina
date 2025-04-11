import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'coffee_machine_state.dart';
import 'coffee_machine_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CoffeeMachineState(),
      child: const CoffeeMachineApp(),
    ),);
}