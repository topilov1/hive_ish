import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_ish/Pages/home_page.dart';
import 'package:hive_ish/model/model.dart';
import 'package:hive_ish/service/service.dart';

class InfoPage extends StatefulWidget {
  static const String path = "infopage";
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late bool tap;
  void press() {
    tap = tap;
    setState(() {});
  }

  List<User> list = [];

  @override
  void initState() {
    list = HiveService.getData();

    super.initState();
  }

  Box box = Hive.box("db");

  @override
  Widget build(BuildContext context) {
    // box.clear();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(HomePage.path);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Saqlab olinganlar")),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return neww(index: index);
            })),
      ),
    );
  }

  Widget neww({required int? index}) {
    return list[index!].isSaved
        ? Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5.0),
            width: double.infinity,
            height: 50,
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(list[index].name),
                IconButton(
                  onPressed: (() {
                    list[index].isSaved = !list[index].isSaved;
                    setState(() {});
                    HiveService.saveData(list);
                  }),
                  icon: Icon(
                      !list[index].isSaved ? Icons.star_outline : Icons.star),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
