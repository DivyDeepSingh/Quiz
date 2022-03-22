// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionModelHive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionsModelAdapter extends TypeAdapter<QuestionsModel> {
  @override
  final int typeId = 1;

  @override
  QuestionsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionsModel()
      ..id = fields[0] as int?
      ..question = fields[1] as String?
      ..correctAnswer = fields[2] as int?
      ..isSelectedAnswer = fields[3] as int?
      ..optionYesValue = fields[4] as int
      ..optionNoValue = fields[5] as int
      ..isSelectedAnswerCorrect = fields[6] as bool?
      ..isSkipped = fields[7] as bool?;
  }

  @override
  void write(BinaryWriter writer, QuestionsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.correctAnswer)
      ..writeByte(3)
      ..write(obj.isSelectedAnswer)
      ..writeByte(4)
      ..write(obj.optionYesValue)
      ..writeByte(5)
      ..write(obj.optionNoValue)
      ..writeByte(6)
      ..write(obj.isSelectedAnswerCorrect)
      ..writeByte(7)
      ..write(obj.isSkipped);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
