import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_ish/Pages/home_page.dart';
import 'package:hive_ish/Pages/info_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("db");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        InfoPage.path: (context) => const InfoPage(),
        HomePage.path: (context) => const HomePage(),
      },
      home: const HomePage(),
    );
  }
}
