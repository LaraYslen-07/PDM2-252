import 'package:flutter/material.dart';
import 'package:teste1/adicionar.dart'; // Certifique-se de que o nome esteja correto

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      home: AddEventScreen(), 
    );
  }
}
