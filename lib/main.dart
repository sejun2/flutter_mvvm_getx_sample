import 'package:flutter/material.dart';
import 'package:flutter_application_2/MyViewModel.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State {
  var listItem = List.empty();
  var myViewModel;

  _onBtnClicked() {
    Get.find<MyViewModel>().fetchData();
  }

  @override
  void initState() {
    myViewModel = Get.put(MyViewModel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON SAMPLE')),
      body: ListView(children: [
        Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _onBtnClicked();
                },
                child: Text('TEST'),
              ),
            ),
            Obx(() => Text('${myViewModel.result.toString()}'))
          ],
        ),
      ]),
    );
  }
}
