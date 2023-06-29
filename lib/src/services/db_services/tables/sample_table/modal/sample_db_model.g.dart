// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SampleTableAdapter extends TypeAdapter<SampleTable> {
  @override
  final int typeId = 1;

  @override
  SampleTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SampleTable()
      ..name = fields[0] as String
      ..bread = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, SampleTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.bread);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SampleTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
