import 'package:flutter/material.dart';
import 'package:modiriat_maly/models/list.dart';
import 'package:modiriat_maly/screens/home.dart';
import 'package:modiriat_maly/screens/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(listviewAdapter());
  await Hive.openBox<listview>("listbox");

  runApp(Mod());
}

class Mod extends StatelessWidget {
  const Mod({Key? key}) : super(key: key);
  static void getdata() {
    Home.listtitle.clear();
    Box<listview> hivebox = Hive.box<listview>("listbox");
    for (var value in hivebox.values) {
      Home.listtitle.add(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainscreen(),
    );
  }
}
