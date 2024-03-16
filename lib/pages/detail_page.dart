import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../data/tourism_place.dart';

class DetailPage extends StatelessWidget {
  final int index;
  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: const Color(0xFFFFFBFF),
          backgroundColor: const Color(0xFF7366FF),
          toolbarHeight: 64,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: const Text(
            'Details',
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
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  _imageCarousel(),
                  const SizedBox(height: 20),
                  _title(context),
                  const SizedBox(height: 20),
                  _infoTable()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageCarousel() {
    return CarouselSlider(
        items: [0, 1, 2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(tourismPlaceList[index].imageUrls[i]),
              );
            },
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 4 / 3,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
        ));
  }

  Widget _title(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 350) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tourismPlaceList[index].name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            Text(
              tourismPlaceList[index].ticketPrice,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF7366FF),
              ),
            ),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            tourismPlaceList[index].name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            tourismPlaceList[index].ticketPrice,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xFF7366FF),
            ),
          ),
        ],
      );
    }
  }

  Widget _infoTable() {
    return Table(
      border: TableBorder.all(color: Colors.transparent),
      columnWidths: const {0: FixedColumnWidth(150)},
      children: [
        TableRow(
          children: [
            const TableCell(
              child: SizedBox(
                width: 50,
                child: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            TableCell(
              child: Text(tourismPlaceList[index].description),
            )
          ],
        ),
        TableRow(
          children: [
            const TableCell(
              child: SizedBox(
                width: 50,
                child: Text(
                  'Open Days',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            TableCell(
              child: Text(tourismPlaceList[index].openDays),
            )
          ],
        ),
        TableRow(
          children: [
            const TableCell(
              child: Text(
                'Open Hours',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            TableCell(
              child: Text(tourismPlaceList[index].openTime),
            )
          ],
        ),
      ],
    );
  }
}
