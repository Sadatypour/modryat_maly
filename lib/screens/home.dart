import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modiriat_maly/const.dart';
import 'package:modiriat_maly/main.dart';
import 'package:modiriat_maly/models/list.dart';
import 'package:modiriat_maly/models/utils/extension.dart';
import 'package:modiriat_maly/screens/new_add.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static List<listview> listtitle = [
    listview(id: 1, title: "test", price: "2000", date: "1400/1/3", DorP: true),
    listview(
        id: 2, title: "test6", price: "13444", date: "1400/06/09", DorP: false)
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController Searchcontroller = TextEditingController();
  Box<listview> hivebox = Hive.box("listbox");

  @override
  void initState() {
    Mod.getdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(79, 68, 156, 232),
      floatingActionButton: Container(
        height: 50.0,
        width: 50.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              New_add.titlecontroller.text = "";
              New_add.pricecontroller.text = "";
              New_add.groupid = 0;
              New_add.Edit = false;
              New_add.date = "تاریخ";
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => New_add(),
                  )).then(
                (value) {
                  Mod.getdata();
                  setState(() {});
                },
              );
            },
            child: Icon(Icons.add),
            backgroundColor: bluclrp,
          ),
        ),
      ),
      //ghesmat pain end
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, left: 5),
              child: Row(
                children: [
                  Expanded(
                    child: SearchBarAnimation(
                        textEditingController: Searchcontroller,
                        hintText: "جستجو کنید...^_^",
                        buttonIcon: Icons.search,
                        buttonColour: bluclrp,
                        buttonIconColour: Colors.white,
                        onFieldSubmitted: (String text) {
                          Iterable<listview> result = hivebox.values
                              .where((value) =>
                                  value.title.contains(text) ||
                                  value.date.contains(text))
                              .toList();
                          Home.listtitle.clear();
                          setState(() {
                            for (var value in result) {
                              Home.listtitle.add(value);
                            }
                          });
                        },
                        onCollapseComplete: () {
                          Mod.getdata();
                          Searchcontroller.text = " ";
                          setState(() {});
                        },
                        buttonElevation: 0,
                        isOriginalAnimation: false),
                  ),
                  Image.asset("assets/images/pose_56.png",
                      height: 100, width: 100),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "تراکنش ها",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screensize(context).screenwidth < 1004
                            ? 14
                            : screensize(context).screenwidth * 0.01),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Home.listtitle.isEmpty
                    ? ImagePage()
                    : ListView.builder(
                        itemCount: Home.listtitle.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            //!Edite
                            onTap: () {
                              New_add.titlecontroller.text =
                                  Home.listtitle[index].title;
                              New_add.pricecontroller.text =
                                  Home.listtitle[index].price;
                              New_add.groupid =
                                  Home.listtitle[index].DorP ? 2 : 1;
                              New_add.Edit = true;
                              New_add.id = Home.listtitle[index].id;
                              New_add.date = Home.listtitle[index].date;
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => New_add()))
                                  .then((value) {
                                Mod.getdata();
                                setState(() {});
                              });
                            },
                            //delete
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(70)),
                                        backgroundColor: Colors.white,
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 60),
                                          child: Text(
                                            "از لیست پاک بشه؟",
                                            style: TextStyle(
                                                color: Colors.orange,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "نه",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: bluclrp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          SizedBox(
                                            width: 25,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                hivebox.deleteAt(index);
                                                Mod.getdata();
                                                setState(() {});
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "آره",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: bluclrp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ));
                            },
                            child: listhome(
                              index: index,
                            ),
                          );
                        },
                      ))
          ],
        ),
      ),
    ));
  }
}

class listhome extends StatelessWidget {
  final int index;
  listhome({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 40),
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                  color: Home.listtitle[index].DorP ? redclr : greenclr,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Icon(
                Home.listtitle[index].DorP ? Icons.remove : Icons.add,
                size: 25,
                color: Colors.white,
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Text(
              Home.listtitle[index].title,
              style: TextStyle(
                  fontSize: screensize(context).screenwidth < 1004
                      ? 14
                      : screensize(context).screenwidth * 0.01,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 35),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/pose_57.png",
                        height: 100, width: 80),
                    Text(
                      "تومان",
                      style: TextStyle(
                          fontSize: screensize(context).screenwidth < 1004
                              ? 14
                              : screensize(context).screenwidth * 0.01,
                          fontWeight: FontWeight.bold,
                          color:
                              Home.listtitle[index].DorP ? redclr : greenclr),
                    ),
                    Text(
                      Home.listtitle[index].price,
                      style: TextStyle(
                          fontSize: screensize(context).screenwidth < 1004
                              ? 14
                              : screensize(context).screenwidth * 0.01,
                          fontWeight: FontWeight.bold,
                          color:
                              Home.listtitle[index].DorP ? redclr : greenclr),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Text(
                  Home.listtitle[index].date,
                  style: TextStyle(
                      fontSize: screensize(context).screenwidth < 1004
                          ? 14
                          : screensize(context).screenwidth * 0.01,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 160),
            child: Container(
              width: 330,
              height: 320,
              child: Image.asset("assets/images/pose_59.png"),
            )),
        Text(
          "!تراکنشی جهت نمایش موجود نیست!",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
