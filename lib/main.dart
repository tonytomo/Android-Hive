import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pab_dompet/base_page.dart';

//import all classes here

List<Box> boxList = [];
Future<List<Box>> _openBox() async {
  // If you have multiple boxes, just duplicate
  // var boxSession = await Hive.openBox('box1');
  // var boxComment = await Hive.openBox("box2");
  // boxList.add(boxSession);
  // boxList.add(boxComment);
  return boxList;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDirectory =
  await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  // Hive.registerAdapter(Class1Adapter());
  // Hive.registerAdapter(Class2Adapter());
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      //Text theme for whole app
      theme: ThemeData(fontFamily: 'Oswald'),
      home: FutureBuilder(
        future: _openBox(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text(snapshot.error.toString());
            else
              // After all the boxes are opened
              // Return to base page
              return Base();
          } else
            return Scaffold();
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
