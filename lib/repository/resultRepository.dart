import 'package:hive/hive.dart';
import 'package:quiz_app/hive/questionModelHive.dart';
import 'package:quiz_app/hive/resultModel.dart';

class ResultRepository {
  var resultBox;
  openResultBox() async {
    resultBox = await Hive.openBox<ResultModel>("resultBox");
  }

  checkIfDateExist({required DateTime date}) async {
    await openResultBox();
    var myList = resultBox.values.toList();
// Hive.box('products').putAt(productIndex, _product);

    for (var i = 0; i < myList.length; i++) {
      if (myList[i].date.compareTo(date) == 0) {
        print("We got the date, already added $date");
        return myList[i];
      }
    }
    return;
  }

  updateQuestionList(
      {required int currentIndex, required DateTime date}) async {
    await openResultBox();

    var myList = resultBox.values.toList();

    for (var index = 0; index < myList.length; index++) {
      if (myList[index].date.compareTo(date) == 0) {
        myList[index].currentIndex = currentIndex;
        print(date);
        resultBox.putAt(index, myList[index]);

        return myList[index];
      }
    }
  }

  endQuiz({required DateTime date}) async {
    await openResultBox();

    var myList = resultBox.values.toList();

    for (var index = 0; index < myList.length; index++) {
      if (myList[index].date.compareTo(date) == 0) {
        myList[index].isQuizComplected = true;

        resultBox.putAt(index, myList[index]);

        return myList[index];
      }
    }
  }

  insertResult(
      {required int currentIndex,
      required DateTime date,
      required questionList}) async {
    await openResultBox();
    var myList = resultBox.values.toList();

    ResultModel result = ResultModel();

    result.currentIndex = currentIndex;
    result.date = date;
    result.shuffeledList = questionList;
    await resultBox.add(result);

    print(myList);
  }

  getResult(DateTime date) async {
    await openResultBox();
    var myList = resultBox.values.toList();
    await openResultBox();

    for (var index = 0; index < myList.length; index++) {
      if (myList[index].date.compareTo(date) == 0 &&
          myList[index].isQuizComplected) {
        return myList[index].shuffeledList;
      }
    }
    return;
  }
}
