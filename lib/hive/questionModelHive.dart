import 'package:hive/hive.dart';
part 'questionModelHive.g.dart';

@HiveType(typeId: 1)
class QuestionsModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? question;
  @HiveField(2)
  int? correctAnswer;
  @HiveField(3)
  int? isSelectedAnswer;
  @HiveField(4)
  int optionYesValue = 1;
  @HiveField(5)
  int optionNoValue = 0;
  @HiveField(6)
  bool? isSelectedAnswerCorrect;
  @HiveField(7)
  bool? isSkipped;
  QuestionsModel();
  QuestionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    correctAnswer = json['answer'];
  }
}
