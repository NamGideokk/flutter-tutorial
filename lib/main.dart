import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample/screens/leadingMenu.dart';
import 'package:get/get.dart';
import 'package:sample/state/StateStore.dart';
import './widgets/BottomNaviBarItem.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  print(dotenv.env["testID"] == "");
  print('testPW : ${dotenv.env["testPW"]}');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController textEController = TextEditingController();
  final StateStore stateStore = StateStore();

  void handleSendingBtn(String text) {
    if (text.isEmpty || text == '') {
      print('please input text.');
    } else {
      print(text);
      textEController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateStore(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("APPLE"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                print('click leading iconButton');
              },
            ),
            titleTextStyle: TextStyle(color: Colors.black),
            // backgroundColor: Colors.white,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.add_box_outlined,
                ),
              )
            ],
            actionsIconTheme: IconThemeData(color: Colors.black),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: textEController,
                        onSubmitted: handleSendingBtn,
                        decoration: InputDecoration(hintText: '채팅을 입력하세요.'),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          handleSendingBtn(textEController.text);
                        },
                        icon: Icon(Icons.send),
                        label: Text('전송'),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            stateStore.image,
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.cover,
                            semanticLabel: '차은우',
                          ),
                        ),
                        title: Text('차은우 official'),
                        subtitle: Text('팔로워 ${stateStore.follower}명'),
                        trailing: ElevatedButton(
                          child: Text(
                              stateStore.followState == 0 ? '팔로우' : '언팔로우'),
                          onPressed: () {
                            stateStore.clickButton(stateStore.followState);
                            stateStore.increaseFollower(stateStore.followState);
                            setState(() {});
                          },
                        ),
                        tileColor: Colors.grey[200],
                      ),
                    ),
                    Text(stateStore.name),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNaviBarItem(),
        ),
      ),
    );
  }
}
