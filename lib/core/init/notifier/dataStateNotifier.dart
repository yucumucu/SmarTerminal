import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/home/model.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';


class dataStateNotifier extends ChangeNotifier{

  bool _shiftListDataLoading = false;
  bool get shiftListDataLoading => _shiftListDataLoading;

  List<shiftListItemModel> _shiftListData = [];
  List<shiftListItemModel> get shiftListData => _shiftListData;

  bool _selectedShiftDataLoading = false;
  bool get selectedShiftDataLoading => _selectedShiftDataLoading;

  selectedShiftDataModel? _selectedShiftData = null;
  selectedShiftDataModel? get selectedShiftData => _selectedShiftData;

  bool _mainMenuStatsLoading = false;
  bool get mainMenuStatsLoading => _mainMenuStatsLoading;

  List<homeViewDataModel> _mainMenuStatsData = [];
  List<homeViewDataModel> get mainMenuStatsData => _mainMenuStatsData;



  void changeMainMenuStatsLoadingState(bool state){
    _mainMenuStatsLoading = state;
    notifyListeners();
  }

  void updateMainMenuStatsData(List<homeViewDataModel> mainMenuStatsData){
    _mainMenuStatsData = mainMenuStatsData;
    notifyListeners();
  }


  void changeShiftListDataLoadingState(bool state){
    _shiftListDataLoading = state;
    notifyListeners();
  }

  void updateShiftListData(List<shiftListItemModel> shiftListData){
    _shiftListData = shiftListData;
    notifyListeners();
  }

  void changeSelectedShiftDataLoadingState(bool state){
    _selectedShiftDataLoading = state;
    notifyListeners();
  }

  void updateSelectedShiftData(selectedShiftDataModel selectedShiftData){
    _selectedShiftData = selectedShiftData;
    notifyListeners();
  }

}