
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/home/model.dart';
import 'package:smarterminal/utils/dummyDataGenerator/dummyService.dart';
import 'package:smarterminal/utils/enum/urlEnum.dart';

mixin homeViewMixin{

  Future<void> fetchHomeViewStatsData(BuildContext context) async {

    String rootURL = urlEnum.getRoot.url();
    String mainMenuStatsURL = urlEnum.mainMenuStats.url();

    http.Response response_real = http.Response("", 404);

    /*
    try {
      response_real = await http.get(
          Uri.parse(rootURL + mainMenuStatsURL));
    }catch(e){
      print(e);
    }

     */
    //flutter: {"MADENÄ° YAÄ":5.0,"SÄ°GARA":48.0,"GIDA":314.0}
    // flutter: {"MADENÄ° YAÄ":5.0,"SÄ°GARA":48.0,"GIDA":314.0}

    Map<String, dynamic> data;

    if (response_real.statusCode != 200){
      data = dummyDataService().dummyMainMenuStats();
    }else{
      data = jsonDecode(response_real.body);
    }

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