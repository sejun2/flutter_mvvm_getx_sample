import 'dart:convert';

import 'package:flutter_application_2/MyRepository.dart';
import 'package:flutter_application_2/Result.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MyViewModel extends GetxController {
  MyRepository myRepository = MyRepository();

  RxList<Result> result = List<Result>.empty().obs;

  fetchData() {
    myRepository.fetchData().then((value) {
      var parsed = json.decode(value.body).cast<Map<String, dynamic>>();
      result.clear();
      result
          .addAll(parsed.map<Result>((json) => Result.fromJson(json)).toList());
      update();
    }).onError((error, stackTrace) {
      print(stackTrace);
    });
  }
}
