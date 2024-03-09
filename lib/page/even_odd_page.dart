import 'package:flutter/material.dart';

class EvenOddPage extends StatefulWidget {
  const EvenOddPage({super.key});

  @override
  State<EvenOddPage> createState() => _EvenOddPageState();
}

class _EvenOddPageState extends State<EvenOddPage> {
  String oddColor = '';
  String evenColor = '';
  List<int> red = [0xFFE42F2F, 0xFFFFCCCC];
  List<int> green = [0xFF427A5B, 0xFFDEEDE5];
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
      if (currentValue[0] == '-') {
        _controller.text = currentValue.substring(1, currentValue.length);
      } else {
        _controller.text = '-$currentValue';
      }
    } else {
      setState(() {
        _controller.text = '$currentValue$newText';
      });
    }
  }

  void deleteLastDigit() {
    setState(() {
      final currentValue = _controller.text;
      if (currentValue.isNotEmpty) {
        _controller.text = currentValue.substring(0, currentValue.length - 1);
      }
    });
  }

  void resetDigit() {
    setState(() {
      _controller.text = '';
      oddColor = '';
      evenColor = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            'Odd or Even?',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _odd(context),
                      const SizedBox(width: 15),
                      _even(context),
                    ],
                  ),
                  _inputNumber(),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _deleteButton('AC'),
                      const SizedBox(width: 15),
                      _deleteButton('del'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _inputButton('7'),
                      const SizedBox(width: 15),
                      _inputButton('8'),
                      const SizedBox(width: 15),
                      _inputButton('9'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _inputButton('4'),
                      const SizedBox(width: 15),
                      _inputButton('5'),
                      const SizedBox(width: 15),
                      _inputButton('6'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _inputButton('1'),
                      const SizedBox(width: 15),
                      _inputButton('2'),
                      const SizedBox(width: 15),
                      _inputButton('3'),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _inputButton('+/-'),
                      const SizedBox(width: 15),
                      _inputButton('0'),
                      const SizedBox(width: 15),
                      _calculateButton(context),
                    ],
                  ),
                  // const SizedBox(height: 15),
                  // _resetButton(),
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

  Widget _even(BuildContext context) {
    int primaryColor = 0;
    int secondaryColor = 0;
    if (evenColor == 'red') {
      primaryColor = red[0];
      secondaryColor = red[1];
    } else if (evenColor == 'green') {
      primaryColor = green[0];
      secondaryColor = green[1];
    } else {
      primaryColor = 0xFF9e9e9e;
      secondaryColor = 0xfffffbff;
    }
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 72,
        decoration: BoxDecoration(
          color: Color(secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Color(primaryColor),
          ),
        ),
        child: Center(
          child: Text(
            'Even',
            style: TextStyle(
              fontSize: 18,
              color: Color(primaryColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget _odd(BuildContext context) {
    int primaryColor = 0;
    int secondaryColor = 0;
    if (oddColor == 'red') {
      primaryColor = red[0];
      secondaryColor = red[1];
    } else if (oddColor == 'green') {
      primaryColor = green[0];
      secondaryColor = green[1];
    } else {
      primaryColor = 0xFF9e9e9e;
      secondaryColor = 0xfffffbff;
    }
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: 72,
        decoration: BoxDecoration(
          color: Color(secondaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Color(primaryColor),
          ),
        ),
        child: Center(
          child: Text(
            'Odd',
            style: TextStyle(
              fontSize: 18,
              color: Color(primaryColor),
            ),
          ),
        ),
      ),
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
            style: const TextStyle(fontSize: 28),
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
        size: 28,
      );
    } else {
      text = const Text(
        'AC',
        style: TextStyle(fontSize: 28),
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
            int result =
                int.parse(_controller.text[_controller.text.length - 1]);
            if (result.isEven) {
              setState(() {
                oddColor = 'red';
                evenColor = 'green';
              });
            } else {
              setState(() {
                oddColor = 'green';
                evenColor = 'red';
              });
            }
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
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
