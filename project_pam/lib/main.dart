import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoanCalculatorPage(),
    );
  }
}

class LoanCalculatorPage extends StatefulWidget {
  @override
  _LoanCalculatorPageState createState() => _LoanCalculatorPageState();
}

class _LoanCalculatorPageState extends State<LoanCalculatorPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  double _monthlyPayment = 0.0;
  int _months = 1;

  void _calculateMonthlyPayment() {
    double amount = double.tryParse(_amountController.text) ?? 0.0;
    double interestRate = double.tryParse(_interestController.text) ?? 0.0;
    double monthlyInterestRate = interestRate / 100;

    if (_months > 0 && monthlyInterestRate > 0) {
      _monthlyPayment = (amount * monthlyInterestRate) /
          (1 - pow(1 + monthlyInterestRate, -_months));
    } else {
      _monthlyPayment = 0.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: 'Introduce suma',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text('Scrie numărul de luni: $_months'),
            Slider(
              value: _months.toDouble(),
              min: 1,
              max: 60,
              divisions: 59,
              label: '$_months luni',
              onChanged: (double value) {
                setState(() {
                  _months = value.toInt();
                });
              },
            ),
            TextField(
              controller: _interestController,
              decoration: InputDecoration(
                labelText: 'Introduceți % pe lună',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Text(
              'Vei plăti lunar:',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            Text(
              '${_monthlyPayment.toStringAsFixed(2)}€',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateMonthlyPayment,
              child: Text('Calculează'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

