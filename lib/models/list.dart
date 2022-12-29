import 'package:hive/hive.dart';

part "list.g.dart";

@HiveType(typeId: 0)
class listview {
  @HiveField(1)
  int id;
  @HiveField(2)
  String title;
  @HiveField(3)
  String price;
  @HiveField(4)
  String date;
  @HiveField(5)
  bool DorP;

  listview({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
    required this.DorP,
  });
}
