import 'package:flutter/material.dart';
import 'package:tugas_teori/loginPage.dart';

void main() => runApp(KelompokScreen());

class Kelompok {
  final String nama;
  final String nim;

  Kelompok({required this.nama, required this.nim});
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class KelompokScreen extends StatelessWidget {
  KelompokScreen({super.key});
  final List<Kelompok> _kelompokList = [
    Kelompok(nama: 'Pramana Abhyasa Wicaksana', nim: '123180135')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text('Data Kelompok'),
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
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Nama Anggota')),
            DataColumn(label: Text('NIM Anggota')),
          ],
          rows: _kelompokList
              .map(
                (kelompok) => DataRow(
                  cells: [
                    DataCell(Text(kelompok.nama)),
                    DataCell(Text(kelompok.nim)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}