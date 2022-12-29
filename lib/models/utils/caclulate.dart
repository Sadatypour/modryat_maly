import 'package:hive_flutter/hive_flutter.dart';
import 'package:modiriat_maly/models/list.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

Box<listview> hivebox = Hive.box<listview>("listbox");
//!year
String year = Jalali.now().year.toString();
//!month
String month = Jalali.now().month.toString().length == 1
    ? '0${Jalali.now().month}'
    : Jalali.now().month.toString();
//!day
String day = Jalali.now().day.toString().length == 1
    ? '0${Jalali.now().day}'
    : Jalali.now().day.toString();

class caculate {
  static String today() {
    return year + "/" + month + "/" + day;
  }

  //!day
  static double ptoday() {
    double result = 0;
    for (var value in hivebox.values) {
      if (value.date == today() && value.DorP == true) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double Dtoday() {
    double result = 0;
    for (var value in hivebox.values) {
      if (value.date == today() && value.DorP == false) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

//! p and d month
  static double pmonth() {
    double result = 0;
    for (var value in hivebox.values) {
      if (value.date.substring(5, 7) == month && value.DorP == true) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double dmonth() {
    double result = 0;
    for (var value in hivebox.values) {
      if (value.date.substring(5, 7) == month && value.DorP == false) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  //! year p and d
  static double pyear() {
    double result = 0;
    for (var value in hivebox.values) {
      if (value.date.substring(0, 4) == year && value.DorP == true) {
        result += double.parse(value.price);
      }
    }
    return result;
  }

  static double dyear() {
    double result = 0;
    for (var value in hivebox.values) {
      if (value.date.substring(0, 4) == year && value.DorP == false) {
        result += double.parse(value.price);
      }
    }
    return result;
  }
}
