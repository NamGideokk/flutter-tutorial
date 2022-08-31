import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  print(dotenv.env["testID"] == "");
  print('testPW : ${dotenv.env["testPW"]}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contact App"),
          titleTextStyle: TextStyle(color: Colors.black),
          // backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.add_box_outlined,
              ),
            )
          ],
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        body: ListView(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
                activeIcon: Icon(Icons.home_filled)),
            BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: '샵',
                activeIcon: Icon(Icons.shop_2_outlined)),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '검색',
                activeIcon: Icon(Icons.search_off),
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '내정보',
                activeIcon: Icon(Icons.person_outline)),
          ],
        ),
      ),
    );
  }
}
