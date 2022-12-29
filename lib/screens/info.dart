import 'package:flutter/material.dart';
import 'package:modiriat_maly/const.dart';
import 'package:modiriat_maly/models/utils/caclulate.dart';
import 'package:modiriat_maly/models/utils/extension.dart';
import 'package:modiriat_maly/widgets/chart.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(70, 68, 156, 232),
      body: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            "مدیریت تراکنش ها",
            style: TextStyle(
                fontSize: screensize(context).screenwidth < 1004
                    ? 14
                    : screensize(context).screenwidth * 0.01,
                color: bluclrp,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 30, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  caculate.ptoday().toString(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    ": پرداختی امروز ",
                    style: TextStyle(
                        fontSize: screensize(context).screenwidth < 1004
                            ? 14
                            : screensize(context).screenwidth * 0.01,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ///////////////////////////////////////
                Text(
                  caculate.Dtoday().toString(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    ": دریافتی امروز ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ///////////************ */
                ///
              ],
            ),
          ),
          ///////////////////////
          ///
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 10, left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                caculate.pmonth().toString(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  ": پرداختی ماه",
                  style: TextStyle(
                      fontSize: screensize(context).screenwidth < 1004
                          ? 14
                          : screensize(context).screenwidth * 0.01,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              ///////////////////////////////////////
              Text(
                caculate.dmonth().toString(),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  ": دریافتی ماه ",
                  style: TextStyle(
                      fontSize: screensize(context).screenwidth < 1004
                          ? 14
                          : screensize(context).screenwidth * 0.01,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
          ///////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.only(right: 30, top: 10, left: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Text(
                caculate.pyear().toString(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  ": پرداختی سال",
                  style: TextStyle(
                      fontSize: screensize(context).screenwidth < 1004
                          ? 14
                          : screensize(context).screenwidth * 0.01,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              ///////////////////////////////////////
              Text(
                caculate.dyear().toString(),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  ": دریافتی سال ",
                  style: TextStyle(
                      fontSize: screensize(context).screenwidth < 1004
                          ? 14
                          : screensize(context).screenwidth * 0.01,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),

          Container(
            margin: EdgeInsets.only(top: 130),
            height: 400,
            width: 400,
            child: chart(),
          )
        ]),
      ),
    ));
  }
}
