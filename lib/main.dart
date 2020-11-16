import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: CalculatorFrame());
}

class CalculatorFrame extends StatefulWidget {
  CalculatorFrame({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CalculatorFrame createState() => _CalculatorFrame();
}

class _CalculatorFrame extends State<CalculatorFrame> {
  String Output = '0', AnsOutput = '', operator = '';
  double value1 = 0.0, value2 = 0.0;

  CalculateOut({String inDigit}) {
    if (inDigit == '+' || inDigit == '-' || inDigit == '÷' || inDigit == '×') {
      operator = inDigit;
      value1 = double.parse(Output);
      AnsOutput = '';
    } else if (inDigit == 'AC') {
      Output = '0';
      AnsOutput = '';
      operator = '';
      value1 = 0.0;
      value2 = 0.0;
    } else if (inDigit == '%') {
      if (value1 == 0.0) {
        value1 = double.parse(Output);
        value1 = value1 / 100;
        AnsOutput = (value1).toString();
      } else {
        value2 = double.parse(Output);
        value2 = value2 / 100;
        AnsOutput = (value2).toString();
      }
    } else if (inDigit == '±') {
      if (value1 == 0.0) {
        value1 = double.parse(Output);
        value1 = value1 * -1;
        AnsOutput = (value1).toString();
      } else {
        value2 = double.parse(Output);
        value2 = value2 * -1;
        AnsOutput = (value2).toString();
      }
    } else if (inDigit == '.') {
      if (AnsOutput.contains('.')) {
        print('no');
      } else {
        AnsOutput = AnsOutput + inDigit;
      }
    } else if (inDigit == '=') {
      value2 = double.parse(Output);
      if (operator == '+') {
        AnsOutput = (value1 + value2).toString();
      } else if (operator == '-') {
        AnsOutput = (value1 - value2).toString();
      } else if (operator == '÷') {
        AnsOutput = (value1 / value2).toString();
      } else if (operator == '×') {
        AnsOutput = (value1 * value2).toString();
      }
      value1 = 0.0;
      value2 = 0.0;
      operator = '';
    } else {
      AnsOutput = AnsOutput + inDigit;
    }

    setState(() {
      Output = AnsOutput;
    });
    print(Output);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Text(''),
            Expanded(
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  Output,
                  style: TextStyle(fontSize: 60.0, color: Colors.white),
                ),
              ),
            ),
            buildGrid(
                a: 'AC', w: Colors.grey[300], TCa: Colors.black87,
                b: '±', x: Colors.grey[300], TCb: Colors.black87,
                c: '%', y: Colors.grey[300], TCc: Colors.black87,
                d: '÷', z: Colors.amber[600], TCd: Colors.white),
            buildGrid(
                a: '1', w: Colors.grey[700], TCa: Colors.white,
                b: '2', x: Colors.grey[700], TCb: Colors.white,
                c: '3', y: Colors.grey[700], TCc: Colors.white,
                d: '×', z: Colors.amber[600], TCd: Colors.white),
            buildGrid(
                a: '4', w: Colors.grey[700], TCa: Colors.white,
                b: '5', x: Colors.grey[700], TCb: Colors.white,
                c: '6', y: Colors.grey[700], TCc: Colors.white,
                d: '-', z: Colors.amber[600], TCd: Colors.white),
            buildGrid(
                a: '7', w: Colors.grey[700], TCa: Colors.white,
                b: '8', x: Colors.grey[700], TCb: Colors.white,
                c: '9', y: Colors.grey[700], TCc: Colors.white,
                d: '+', z: Colors.amber[600], TCd: Colors.white),
            botRow(
                a: '0', x: Colors.grey[700], TCa: Colors.white,
                b: '.', y: Colors.grey[700], TCb: Colors.white,
                c: '=', z: Colors.amber[600], TCc: Colors.white)
          ],
        ),
      ),
    );
  }

  Widget DigitButton({String digit, Color BColor, TColor}) {
    return Expanded(
      child: ButtonTheme(
        minWidth: 100,
        height: 100,
        child: FlatButton(
          onPressed: () {
            CalculateOut(inDigit: '$digit');
          },
          color: BColor,
          child: Text(
            '$digit',
            style: TextStyle(fontSize: 30.0, color: TColor),
          ),
        ),
      ),
    );
  }

  Widget buildGrid({String a, b, c, d, Color w, x, y, z, TCa, TCb, TCc, TCd, double}) {
    return Row(
      children: <Widget>[
        DigitButton(digit: '$a', BColor: w, TColor: TCa),
        DigitButton(digit: '$b', BColor: x, TColor: TCb),
        DigitButton(digit: '$c', BColor: y, TColor: TCc),
        DigitButton(digit: '$d', BColor: z, TColor: TCd)
      ],
    );
  }

  Widget botRow({String a, b, c, Color x, y, z, TCa, TCb, TCc,}) {
    return Row(
      children: <Widget>[
        DigitButton(digit: '$a', BColor: x, TColor: TCa),
        DigitButton(digit: '$b', BColor: y, TColor: TCb),
        DigitButton(digit: '$c', BColor: z, TColor: TCc)
      ],
    );
  }
}
