import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_ish/Pages/info_page.dart';
import 'package:hive_ish/model/model.dart';
import 'package:hive_ish/service/service.dart';

class HomePage extends StatefulWidget {
  static const String path = "homepage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool tap;
  void press() {
    tap = tap;
    setState(() {});
  }

  savelis() {
    List<User> listw = [
      User(name: "flutter", isSaved: false),
      User(name: "java", isSaved: false),
      User(name: "phyton", isSaved: false),
      User(name: "php", isSaved: false),
      User(name: "dart", isSaved: false),
      User(name: "C++", isSaved: false),
      User(name: "swift", isSaved: false),
      User(name: "kotlin", isSaved: false),
      User(name: "C#", isSaved: false),
    ];
    HiveService.saveData(listw);
  }

  List<User> list = [];

  @override
  void initState() {
    savelis();
    list = HiveService.getData();
    super.initState();
  }

  Box box = Hive.box("db");

  @override
  Widget build(BuildContext context) {
    // box.clear();
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(InfoPage.path);
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: ((context, index) {
            return neww(index: index);
          }),
        ),
      ),
    );
  }

  Widget neww({required int? index}) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5.0),
      width: double.infinity,
      height: 50,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(list[index!].name),
          IconButton(
            onPressed: (() {
              list[index].isSaved = !list[index].isSaved;
              setState(() {});
              HiveService.saveData(list);
            }),
            icon: Icon(!list[index].isSaved ? Icons.star_outline : Icons.star),
          ),
        ],
      ),
    );
  }
}
