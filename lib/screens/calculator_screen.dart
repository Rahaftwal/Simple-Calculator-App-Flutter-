import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '';
  String _operation = '';
  String _firstNumberDisplay = '';
  String _expression = '';
  double _firstNumber = 0;
  bool _isNewNumber = true;

  void _onNumberPressed(String number) {
    setState(() {
      if (_isNewNumber) {
        _input = number;
        _isNewNumber = false;
      } else {
        _input += number;
      }
      // Update the expression
      if (_firstNumberDisplay.isEmpty) {
        _expression = _input;
      } else {
        _expression = '$_firstNumberDisplay $_operation $_input';
      }
    });
  }

  void _onOperationPressed(String operation) {
    setState(() {
      _firstNumber = double.parse(_input);
      _firstNumberDisplay = _input;
      _operation = operation;
      _isNewNumber = true;
      // Update the expression
      _expression = '$_firstNumberDisplay $operation';
    });
  }

  void _onEqualPressed() {
    if (_operation.isEmpty) return;

    double secondNumber = double.parse(_input);
    double result = 0;

    setState(() {
      switch (_operation) {
        case '+':
          result = _firstNumber + secondNumber;
          break;
        case '-':
          result = _firstNumber - secondNumber;
          break;
        case '×':
          result = _firstNumber * secondNumber;
          break;
        case '÷':
          if (secondNumber != 0) {
            result = _firstNumber / secondNumber;
          } else {
            _result = 'Error';
            return;
          }
          break;
      }

      _result = result.toString();
      if (_result.endsWith('.0')) {
        _result = _result.substring(0, _result.length - 2);
      }
      _input = _result;
      _firstNumberDisplay = '';
      _operation = '';
      _expression = '';
      _isNewNumber = true;
    });
  }

  void _onClearPressed() {
    setState(() {
      _input = '';
      _result = '';
      _operation = '';
      _firstNumberDisplay = '';
      _expression = '';
      _firstNumber = 0;
      _isNewNumber = true;
    });
  }

  Widget _buildButton(String text, {Color? color, VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[200],
            foregroundColor: color != null ? Colors.white : Colors.black87,
            padding: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display
          Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.bottomRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Expression display
                Text(
                  _expression.isEmpty ? '0' : _expression,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Result
                if (_result.isNotEmpty && _input == _result)
                  Text(
                    '= $_result',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Keypad
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7', onPressed: () => _onNumberPressed('7')),
                        _buildButton('8', onPressed: () => _onNumberPressed('8')),
                        _buildButton('9', onPressed: () => _onNumberPressed('9')),
                        _buildButton('÷', 
                          color: Colors.blue,
                          onPressed: () => _onOperationPressed('÷'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4', onPressed: () => _onNumberPressed('4')),
                        _buildButton('5', onPressed: () => _onNumberPressed('5')),
                        _buildButton('6', onPressed: () => _onNumberPressed('6')),
                        _buildButton('×',
                          color: Colors.blue,
                          onPressed: () => _onOperationPressed('×'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1', onPressed: () => _onNumberPressed('1')),
                        _buildButton('2', onPressed: () => _onNumberPressed('2')),
                        _buildButton('3', onPressed: () => _onNumberPressed('3')),
                        _buildButton('-',
                          color: Colors.blue,
                          onPressed: () => _onOperationPressed('-'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('C',
                          color: Colors.red,
                          onPressed: _onClearPressed,
                        ),
                        _buildButton('0', onPressed: () => _onNumberPressed('0')),
                        _buildButton('=',
                          color: Colors.green,
                          onPressed: _onEqualPressed,
                        ),
                        _buildButton('+',
                          color: Colors.blue,
                          onPressed: () => _onOperationPressed('+'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 