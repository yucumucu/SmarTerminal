


import 'package:flutter/material.dart';


class uiNotifier extends ChangeNotifier{

  bool isSalesOfShiftWidgetExtended = false;

  // Getter for the value of isSalesOfShiftWidgetExtended


  void changeSalesDataVisibility(){
    isSalesOfShiftWidgetExtended = !isSalesOfShiftWidgetExtended;
    notifyListeners();
  }


}