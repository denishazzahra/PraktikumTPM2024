import 'package:flutter/material.dart';
import 'package:tugas_teori/loginPage.dart';

class GanjilGenapApp extends StatefulWidget {
  @override
  _GanjilGenapAppState createState() => _GanjilGenapAppState();
}

class _GanjilGenapAppState extends State<GanjilGenapApp> {
  TextEditingController _numberController = TextEditingController();
  var hasil = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: const Text('Ganjil Genap'),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: _numberController,
                showCursor: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.07),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.07)),
                ),
                onPressed: () {
                  setState(() {
                    int? angka = int.tryParse(_numberController.text);
                    if (angka != null) {
                      hasil = angka % 2 == 0 ? 'Genap' : 'Ganjil';
                    } else {
                      hasil = 'Masukkan angka valid';
                    }
                  });
                },
                child: Text('Cek Ganjil/Genap'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Hasil: $hasil',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.05),
//             )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
