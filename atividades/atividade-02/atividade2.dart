
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class Equipe {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  Equipe(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {

  var dep1 = Dependente('Anderson');
  var dep2 = Dependente('Taveira');
  var dep3 = Dependente('Alyne');
  var dep4 = Dependente('Pedro');

  var func1 = Funcionario('Lara', [dep1, dep2]);
  var func2 = Funcionario('Layhanna', [dep3]);
  var func3 = Funcionario('Odílio', [dep4]);

  var funcionarios = [func1, func2, func3];

  var equipe = Equipe('Trabalho da equipe de PDM-2', funcionarios);
  
  print(jsonEncode(equipe.toJson()));
}