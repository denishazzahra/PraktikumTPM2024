import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'login_page.dart';
import '../data/tourism_place.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStorage checkLogin = GetStorage('checkLogin');
    final username = checkLogin.read('username');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          backgroundColor: const Color(0xFF7366FF),
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/logo_white.png',
              fit: BoxFit.contain,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, $username!',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFFFFFBFF),
                  ),
                ),
                Text(
                  'Enjoy your travel with Traveloco.',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _logoutButton(context, checkLogin),
            )
          ],
        ),
        body: _tourismList(context),
      ),
    );
  }

  Widget _tourismList(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 520) {
      return ListView.builder(
        padding: const EdgeInsets.all(15),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(index: index);
                  },
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    child: Image.network(
                      tourismPlaceList[index].imageUrls[0],
                      width: 150 * 4 / 5,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tourismPlaceList[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${tourismPlaceList[index].location}\n${tourismPlaceList[index].openDays}\n🕒 ${tourismPlaceList[index].openTime}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            tourismPlaceList[index].ticketPrice,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7366FF),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      );
    } else {
      int gridCount;
      if (screenWidth > 520 && screenWidth <= 768) {
        gridCount = 2;
      } else if (screenWidth > 768 && screenWidth <= 1024) {
        gridCount = 3;
      } else {
        gridCount = 4;
      }
      return GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: gridCount,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(index: index);
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double imageWidth = constraints.maxWidth;
                      double imageHeight = imageWidth / 2;
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Image.network(
                          tourismPlaceList[index].imageUrls[0],
                          height: imageHeight,
                          width: imageWidth,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tourismPlaceList[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${tourismPlaceList[index].location}\n${tourismPlaceList[index].openDays}\n🕒 ${tourismPlaceList[index].openTime}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          tourismPlaceList[index].ticketPrice,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF7366FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      );
    }
  }

  Widget _logoutButton(BuildContext context, GetStorage checkLogin) {
    return IconButton(
      iconSize: 24,
      icon: const Icon(Icons.logout),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              checkLogin.write('isLoggedIn', false);
              checkLogin.write('username', '');
              return const LoginPage();
            },
          ),
        );
      },
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color(0xFFFFFBFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
