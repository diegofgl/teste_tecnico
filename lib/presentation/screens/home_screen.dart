import 'package:flutter/material.dart';
import 'package:tracking_manager/data/repositories/fibonacci_repositoryImpl.dart';
import 'package:tracking_manager/data/repositories/letter_repositoryImpl.dart';
import '../../domain/usecases/check_fibonacci_usecase.dart';
import '../../domain/usecases/count_letter_usecase.dart';
import '../../domain/usecases/calculate_soma_usecase.dart';
import '../../domain/usecases/complete_sequences_usecase.dart';
import '../../domain/usecases/describe_interruptors_usecase.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fibonacciController = TextEditingController();
  final TextEditingController _stringController = TextEditingController();
  final CheckFibonacciUseCase _checkFibonacciUseCase =
      CheckFibonacciUseCase(FibonacciRepositoryImpl());
  final CountLetterUseCase _countLetterUseCase =
      CountLetterUseCase(LetterRepositoryImpl());
  final CalculateSomaUseCase _calculateSomaUseCase = CalculateSomaUseCase();
  final CompleteSequencesUseCase _completeSequencesUseCase =
      CompleteSequencesUseCase();
  final DescribeInterruptorsUseCase _describeInterruptorsUseCase =
      DescribeInterruptorsUseCase();

  String _fibonacciResult = '';
  String _letterResult = '';
  String _somaResult = '';
  String _sequenceResult = '';

  bool _showFibonacciResult = false;
  bool _showLetterResult = false;
  bool _showSomaResult = false;
  bool _showSequenceResult = false;
  bool _showInterruptorsResult = false;

  void _checkFibonacci() {
    final int number = int.tryParse(_fibonacciController.text) ?? 0;
    if (number < 0) {
      setState(() {
        _fibonacciResult = 'Please enter a non-negative number.';
        _showFibonacciResult = true;
      });
      return;
    }

    bool isFibonacci = _checkFibonacciUseCase.execute(number);
    setState(() {
      _fibonacciResult = isFibonacci
          ? '$number é um número Fibonacci'
          : '$number não é um número Fibonacci';
      _showFibonacciResult = !_showFibonacciResult;
    });
  }

  void _countLetterA() {
    final String text = _stringController.text;
    final int count = _countLetterUseCase.execute(text, 'a') +
        _countLetterUseCase.execute(text, 'A');
    setState(() {
      _letterResult = 'A letra "a" aparece $count vezes';
      _showLetterResult = !_showLetterResult;
    });
  }

  void _calculateSoma() {
    final int indice = 12;
    final int soma = _calculateSomaUseCase.execute(indice);
    setState(() {
      _somaResult = 'O valor da SOMA é $soma.';
      _showSomaResult = !_showSomaResult;
    });
  }

  void _completeSequences() {
    setState(() {
      _sequenceResult = _completeSequencesUseCase.execute();
      _showSequenceResult = !_showSequenceResult;
    });
  }

  void _toggleInterruptors() {
    setState(() {
      if (_showInterruptorsResult) {
        _somaResult = '';
      } else {
        _somaResult = _describeInterruptorsUseCase.execute();
      }
      _showInterruptorsResult = !_showInterruptorsResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resposta Teste'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Fibonacci Check
            TextField(
              controller: _fibonacciController,
              decoration: InputDecoration(
                labelText: 'Insira um número para verificação de Fibonacci',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _checkFibonacci,
              child: Text('Check Fibonacci'),
            ),
            SizedBox(height: 24),
            if (_showFibonacciResult) ...[
              Text(_fibonacciResult),
              SizedBox(height: 24),
            ],

            // Letter 'a' Count
            TextField(
              controller: _stringController,
              decoration: InputDecoration(
                labelText: 'Digite uma string para contar a letra "a"',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _countLetterA,
              child: Text('Contar Letra A'),
            ),
            SizedBox(height: 24),
            if (_showLetterResult) ...[
              Text(_letterResult),
              SizedBox(height: 24),
            ],

            // Soma Calculation
            ElevatedButton(
              onPressed: _calculateSoma,
              child: Text('Calcular SOMA'),
            ),
            SizedBox(height: 24),
            if (_showSomaResult) ...[
              Text(_somaResult),
              SizedBox(height: 24),
            ],

            // Complete Sequences
            ElevatedButton(
              onPressed: _completeSequences,
              child: Text('Complete as Sequências'),
            ),
            SizedBox(height: 24),
            if (_showSequenceResult) ...[
              Text(_sequenceResult),
              SizedBox(height: 24),
            ],

            // Interruptor Description
            ElevatedButton(
              onPressed: _toggleInterruptors,
              child: Text('Resposta interruptores'),
            ),
            SizedBox(height: 24),
            if (_showInterruptorsResult) ...[
              Text(_somaResult),
              SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
