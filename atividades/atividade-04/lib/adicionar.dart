import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  String eventName = '';
  String eventDescription = '';

  Future<void> salvarEvento(String nome, String descricao) async {
    final url = 'http://177.91.141.169/32:3000/eventos';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'nome': nome,
        'descricao': descricao,
        'data': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Evento salvo no backend')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar evento')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Evento')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome do Evento'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do evento';
                  }
                  return null;
                },
                onSaved: (value) => eventName = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição do Evento'),
                onSaved: (value) => eventDescription = value ?? '',
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    await salvarEvento(eventName, eventDescription);
                  }
                },
                child: Text('Salvar Evento'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
