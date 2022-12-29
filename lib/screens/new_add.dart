import 'dart:math';
import 'package:modiriat_maly/screens/home.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modiriat_maly/const.dart';
import 'package:modiriat_maly/models/list.dart';

class New_add extends StatefulWidget {
  const New_add({Key? key}) : super(key: key);
  static int groupid = 0;
  static int valuee = 1;
  static int valueee = 2;
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController pricecontroller = TextEditingController();
  static bool Edit = false;
  static int id = 0;
  static String date = "تاریخ";
  @override
  State<New_add> createState() => _New_addState();
}

class _New_addState extends State<New_add> {
  Box<listview> hivebox = Hive.box<listview>("listbox");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              New_add.Edit ? "ویرایش تراکنش" : "تراکنش جدید",
              style: TextStyle(
                  fontSize: 25, color: bluclrp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
                controller: New_add.titlecontroller,
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                cursorHeight: 24,
                cursorWidth: 5,
                decoration: InputDecoration(
                  labelText: "توضیحات",
                  labelStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: bluclrp)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bluclrp)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bluclrp)),
                )),
            SizedBox(
              height: 40,
            ),

            //!TEXT TWO

            TextField(
                controller: New_add.pricecontroller,
                keyboardType: TextInputType.number,
                cursorColor: Colors.orange,
                cursorHeight: 24,
                cursorWidth: 5,
                decoration: InputDecoration(
                  labelText: "مبلغ",
                  labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: bluclrp)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bluclrp)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: bluclrp)),
                )),
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    var PackedData = await showPersianDatePicker(
                        context: context,
                        initialDate: Jalali.now(),
                        firstDate: Jalali(1400),
                        lastDate: Jalali(1499));
                    setState(() {
                      String year = PackedData!.year.toString();
                      //!MONTH
                      String month = PackedData.month.toString().length == 1
                          ? "0${PackedData.month.toString()}"
                          : PackedData.month.toString();
                      //!DAY
                      String day = PackedData.day.toString().length == 1
                          ? "0${PackedData.day.toString()}"
                          : PackedData.day.toString();
                      New_add.date = year + "/" + month + "/" + day;
                    });
                  },
                  child: Text(
                    New_add.date,
                    style: const TextStyle(color: bluclrp, fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                      fixedSize: Size(300, 36),
                      backgroundColor: Color.fromARGB(255, 255, 218, 161)),
                ),
              ),
            ),
            Row(
              children: [
                Radio(
                    activeColor: greenclr,
                    value: New_add.valuee,
                    groupValue: New_add.groupid,
                    onChanged: (value) {
                      setState(() {
                        New_add.groupid = New_add.valuee;
                      });
                    }),
                Text("دریافتی",
                    style: TextStyle(
                        color: bluclrp,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Radio(
                      activeColor: redclr,
                      value: New_add.valueee,
                      groupValue: New_add.groupid,
                      onChanged: (value) {
                        setState(() {
                          New_add.groupid = New_add.valueee;
                        });
                      }),
                ),
                Text(
                  "پرداختی",
                  style: TextStyle(
                      color: bluclrp,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),

            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    listview item = listview(
                      id: Random().nextInt(9999),
                      title: New_add.titlecontroller.text,
                      price: New_add.pricecontroller.text,
                      date: New_add.date,
                      DorP: New_add.groupid == 1 ? false : true,
                    );
                    if (New_add.Edit) {
                      int index = 0;
                      for (int i = 0; i < hivebox.values.length; i++) {
                        if (hivebox.values.elementAt(i).id == New_add.id) {
                          index = i;
                        }
                      }
                      hivebox.putAt(index, item);
                      //Home.listtitle[New_add.index] = item;
                    } else {
                      hivebox.add(item);
                      // Home.listtitle.add(item);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    New_add.Edit ? "اعمال ویرایش" : "اضافه کردن",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  style: TextButton.styleFrom(backgroundColor: bluclrp),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 300, top: 200),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 94, 180, 245),
                    elevation: 8),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "بازگشت",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
