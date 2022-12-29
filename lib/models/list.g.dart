// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class listviewAdapter extends TypeAdapter<listview> {
  @override
  final int typeId = 0;

  @override
  listview read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return listview(
      id: fields[1] as int,
      title: fields[2] as String,
      price: fields[3] as String,
      date: fields[4] as String,
      DorP: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, listview obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.DorP);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is listviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
