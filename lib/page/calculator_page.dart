import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  List<String> num = [];
  List<String> equation = [];
  final parser = Parser();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateTextField(String newText) {
    final currentValue = _controller.text;
    if (newText == '+/-') {
      if (currentValue.isEmpty || currentValue[0] != '-') {
        _controller.text = '-$currentValue';
      } else {
        _controller.text = currentValue.substring(1, currentValue.length);
      }
    } else {
      if (!(newText == '.' &&
          (currentValue.contains('.') || currentValue.isEmpty))) {
        setState(() {
          _controller.text = '$currentValue$newText';
        });
      } else {
        const SnackBar snackbar =
            SnackBar(content: Text('Invalid input format!'));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
  }

  void updateList(BuildContext context, String sym) {
    if (num.isEmpty && _controller.text.isEmpty || _controller.text == '-') {
      const SnackBar snackbar =
          SnackBar(content: Text('Invalid input format!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (num.isNotEmpty && _controller.text.isEmpty) {
      setState(() {
        equation[equation.length - 1] = sym;
      });
    } else {
      setState(() {
        String temp = _controller.text;
        if (temp[0] == '-') {
          num.add('($temp)');
        } else {
          num.add(_controller.text);
        }
        equation.add(sym);
        _controller.text = '';
      });
    }
  }

  void deleteLastDigit() {
    setState(() {
      final currentValue = _controller.text;
      if (currentValue.isNotEmpty) {
        _controller.text = currentValue.substring(0, currentValue.length - 1);
      } else if (currentValue.isEmpty && num.isNotEmpty) {
        setState(() {
          equation.removeLast();
          String temp = num[num.length - 1];
          if (temp[0] == '(') {
            temp = temp.substring(1, temp.length - 1);
          }
          _controller.text = temp;
          num.removeLast();
        });
      }
    });
  }

  void resetDigit() {
    setState(() {
      _controller.text = '';
      num.clear();
      equation.clear();
    });
  }

  void calculationResult(BuildContext context) {
    if (_controller.text.isEmpty) {
      const SnackBar snackbar =
          SnackBar(content: Text('Invalid input format!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      String expression = '';
      for (var i = 0; i < num.length; i++) {
        expression += num[i] + equation[i];
      }
      expression += _controller.text;
      var parsedExpression = parser.parse(expression);
      dynamic result =
          parsedExpression.evaluate(EvaluationType.REAL, ContextModel());
      setState(() {
        _controller.text = result.toString();
        num.clear();
        equation.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            'Calculator',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  _inputNumber(),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _deleteButton('AC'),
                      const SizedBox(width: 15),
                      _deleteButton('del'),
                      const SizedBox(width: 15),
                      _equationButton(context, 'mod'),
                      const SizedBox(width: 15),
                      _equationButton(context, '÷'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _inputButton('7'),
                      const SizedBox(width: 15),
                      _inputButton('8'),
                      const SizedBox(width: 15),
                      _inputButton('9'),
                      const SizedBox(width: 15),
                      _equationButton(context, '×'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _inputButton('4'),
                      const SizedBox(width: 15),
                      _inputButton('5'),
                      const SizedBox(width: 15),
                      _inputButton('6'),
                      const SizedBox(width: 15),
                      _equationButton(context, '-'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _inputButton('1'),
                      const SizedBox(width: 15),
                      _inputButton('2'),
                      const SizedBox(width: 15),
                      _inputButton('3'),
                      const SizedBox(width: 15),
                      _equationButton(context, '+'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      _inputButton('+/-'),
                      const SizedBox(width: 15),
                      _inputButton('0'),
                      const SizedBox(width: 15),
                      _inputButton('.'),
                      const SizedBox(width: 15),
                      _calculateButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputNumber() {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 42,
        color: Colors.black,
      ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 64, horizontal: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
      onChanged: (value) {},
    );
  }

  Widget _inputButton(String number) {
    return Expanded(
      child: SizedBox(
        height: 72,
        child: ElevatedButton(
          onPressed: () {
            updateTextField(number);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: Text(
            number,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _equationButton(BuildContext context, String equation) {
    String sym;
    if (equation == '÷') {
      sym = '/';
    } else if (equation == '×') {
      sym = '*';
    } else if (equation == 'mod') {
      sym = '%';
    } else {
      sym = equation;
    }
    return Expanded(
      child: SizedBox(
        height: 72,
        child: ElevatedButton(
          onPressed: () {
            updateList(context, sym);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: const Color(0xfffec045),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: Text(
            equation,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _deleteButton(String mode) {
    dynamic text;
    if (mode == 'del') {
      text = const Icon(
        Icons.backspace_outlined,
        size: 18,
      );
    } else {
      text = const Text(
        'AC',
        style: TextStyle(fontSize: 18),
      );
    }
    return Expanded(
      child: SizedBox(
        height: 72,
        child: ElevatedButton(
          onPressed: () {
            if (mode == 'del') {
              deleteLastDigit();
            } else {
              resetDigit();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff868686),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: text,
        ),
      ),
    );
  }

  Widget _calculateButton(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 72,
        child: ElevatedButton(
          onPressed: () {
            calculationResult(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfffec045),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: const EdgeInsets.all(15),
          ),
          child: const Text(
            '=',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
