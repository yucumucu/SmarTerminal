
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/home/model.dart';
import 'package:smarterminal/utils/dummyDataGenerator/dummyService.dart';

mixin homeViewMixin{

  Future<void> fetchHomeViewStatsData(BuildContext context) async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200){

      //Map<String, dynamic> data = jsonDecode(response.body);
      Map<String,dynamic> data = dummyDataService().dummyMainMenuStats();

      List<homeViewDataModel> homeViewData = [];

      double total = 0;

      data.forEach((key,value){
        total = total + double.parse(value.toString());
      });

      data.forEach((key, value) {

        double percentage = double.parse(value.toString()) / total;

        homeViewData.add(homeViewDataModel(
          categoryName: key,
          categoryPercentage: percentage
        ));
      }

      );
      context.read<dataStateNotifier>().updateMainMenuStatsData(homeViewData);

    }


  }

}