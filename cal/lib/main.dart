import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  String result = '0';
  String operator = '';
  double firstNum = 0.0;
  double secondNum = 0.0;

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '0';
        operator = '';
        firstNum = 0.0;
        secondNum = 0.0;
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        operator = value;
        firstNum = double.parse(input);
        input = '';
      } else if (value == '=') {
        secondNum = double.parse(input);

        switch (operator) {
          case '+':
            result = (firstNum + secondNum).toString();
            break;
          case '-':
            result = (firstNum - secondNum).toString();
            break;
          case '×':
            result = (firstNum * secondNum).toString();
            break;
          case '÷':
            result = (firstNum / secondNum).toString();
            break;
          default:
            result = 'Error';
        }
        input = result;
      } else {
        input += value;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: EdgeInsets.all(50),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Text(
              input.isEmpty ? '0' : input,
              style: TextStyle(color: Colors.white, fontSize: 36),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              result,
              style: TextStyle(color: Colors.green, fontSize: 48),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey),
          ),

          Column(
            children: [
              SizedBox(height: 16), 
              Row(
                
                children: [
                  SizedBox(height: 16), 
                  buildButton('7', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('8', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('9', Colors.grey[850]!),
                     SizedBox(width: 16),
                  buildButton('÷', Colors.orange),
                  SizedBox(height: 16), 
                ],
              ),
              SizedBox(height: 16), 
              Row(
                children: [
                  buildButton('4', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('5', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('6', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('×', Colors.orange),

                ],
              ),
              SizedBox(height: 16), 
              Row(
                children: [
                  buildButton('1', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('2', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('3', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('-', Colors.orange),
                ],
              ),
              SizedBox(height: 16), 
              Row(
                children: [
                  buildButton('C', Colors.red),
                    SizedBox(width: 16),
                  buildButton('0', Colors.grey[850]!),
                    SizedBox(width: 16),
                  buildButton('=', Colors.green),
                    SizedBox(width: 16),
                  buildButton('+', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
