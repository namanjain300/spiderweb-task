import 'package:flutter/material.dart';
import 'package:spiderweb_task/screens/global_reports_scrn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpiderWeb Task',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GlobalReportsScreen(),
    );
  }
}
