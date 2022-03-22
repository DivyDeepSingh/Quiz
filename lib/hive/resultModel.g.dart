// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultModelAdapter extends TypeAdapter<ResultModel> {
  @override
  final int typeId = 0;

  @override
  ResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultModel()
      ..date = fields[0] as DateTime?
      ..shuffeledList = (fields[1] as List?)?.cast<QuestionsModel>()
      ..currentIndex = fields[2] as int?
      ..isQuizComplected = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, ResultModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.shuffeledList)
      ..writeByte(2)
      ..write(obj.currentIndex)
      ..writeByte(3)
      ..write(obj.isQuizComplected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
