import 'package:hive/hive.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
part 'resultModel.g.dart';

@HiveType(typeId: 0)
class ResultModel {
  @HiveField(0)
  DateTime? date;
  @HiveField(1)
  List<QuestionsModel>? shuffeledList;

  @HiveField(2)
  int? currentIndex;

  @HiveField(3)
  bool isQuizComplected = false;

  ResultModel();
}
