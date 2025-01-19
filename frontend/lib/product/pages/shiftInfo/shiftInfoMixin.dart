import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';
import 'package:smarterminal/utils/dummyDataGenerator/dummyService.dart';
import 'package:smarterminal/utils/enum/urlEnum.dart';

mixin shiftInfoMixin{

  String rootURL = urlEnum.getRoot.url();
  String shiftList = urlEnum.getShiftSummaries.url();


  // add shift list to state incoming data is a list of json
  Future<void> fetchShiftList(BuildContext context) async {
    // get data from api
    // add data to state
    try {



      http.Response response_real = await http.get(
          Uri.parse(rootURL + shiftList));



      List<dynamic> shiftListJson;
      List<shiftListItemModel> shiftListData;

      if (response_real.statusCode != 200){

        shiftListJson= dummyDataService().dummyShiftList();

        shiftListData = shiftListJson.map((e) => shiftListItemModel.fromJson(e)).toList();

      }else{

        shiftListJson = jsonDecode(response_real.body);

        shiftListData = shiftListJson.map((e) => shiftListItemModel.fromJson(e)).toList();

      }


      context.read<dataStateNotifier>().updateShiftListData(shiftListData);
    }
    catch(e){
      print(e);
    }

  }

  Future<void> fetchSelectedShiftData(BuildContext context, String id, int index) async{

    String shiftDetailURL = urlEnum.getShiftDetails.url(id);
    String rootURL = urlEnum.getRoot.url();



    try {
      http.Response response_real = await http.get(Uri.parse(rootURL + shiftDetailURL));


      Map<String,dynamic> data;

      if(response_real.statusCode != 200){
        data = dummyDataService().dummySelectedShift();
      }else{
        data = jsonDecode(response_real.body);
      }
      tempModel tmp = tempModel.fromJson(data);

      shiftListItemModel itemModel = context.read<dataStateNotifier>().shiftListData[index];
      selectedShiftDataModel selectedShiftData = itemModel.mergeToSelectedShiftModel(tmp);

      context.read<dataStateNotifier>().updateSelectedShiftData(selectedShiftData);

    }catch(e){
      print(e);
    }



  }



  Future<void> fetchSelectedShiftSalesData(BuildContext context, String id) async {


    String shiftSalesURL = urlEnum.getShiftSales.url(id);
    String rootURl = urlEnum.getRoot.url();



    try {
      http.Response response_real = await http.get(Uri.parse(rootURL + shiftSalesURL));


      Map<String,dynamic> data;

      if(response_real.statusCode != 200){
        data = dummyDataService().dummySelectedShiftSales();
      }else{
        data = jsonDecode(response_real.body);
      }

      List<shiftViewSalesModel> salesData = [];

      data.forEach((key, value) {
        shiftViewSalesModel salesModel = shiftViewSalesModel(
            productName: key,
            amount: value
        );

        salesData.add(salesModel);
      });

      context.read<dataStateNotifier>().updateSelectedShiftSalesData(salesData);

    }catch(e){
      print(e);
    }




  }







}