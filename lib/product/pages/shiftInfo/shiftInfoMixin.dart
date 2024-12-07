import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';
import 'package:smarterminal/utils/dummyDataGenerator/dummyService.dart';

mixin shiftInfoMixin{


  // add shift list to state incoming data is a list of json
  Future<void> fetchShiftList(BuildContext context) async {
    // get data from api
    // add data to state

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, then parse the JSON.
      // final List<dynamic> data = jsonDecode(response.body);
      // final List<Shift> shifts = data.map((e) => Shift.fromJson(e)).toList();
      List<Map<String,dynamic>> shiftListJson= dummyDataService().dummyShiftList();
      List<shiftListItemModel> shiftListData = shiftListJson.map((e) => shiftListItemModel.fromJson(e)).toList();

      context.read<dataStateNotifier>().updateShiftListData(shiftListData);

    } else {
      // If the server returns an error response, then throw an exception.
      throw Exception('Failed to load shift');
    }


  }

  Future<void> fetchSelectedShiftData(BuildContext context, int index) async{

    String id = index.toString();

    //request: GET http://localhost:8080/api/shifts/9/details

    //final response = await http.get(Uri.parse('http://localhost:8080/api/shifts/$id/details'));
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode == 200){
      // final Map<String,dynamic> data = jsonDecode(response.body);
      // final Shift shift = Shift.fromJson(data);
      Map<String,dynamic> shiftDataJson = dummyDataService().dummySelectedShift();
      tempModel tmp = tempModel.fromJson(shiftDataJson);

      shiftListItemModel itemModel = context.read<dataStateNotifier>().shiftListData[index];
      selectedShiftDataModel selectedShiftData = itemModel.mergeToSelectedShiftModel(tmp);

      context.read<dataStateNotifier>().updateSelectedShiftData(selectedShiftData);

    }else{
      throw Exception('Failed to load selected shift');
    }
  }







}