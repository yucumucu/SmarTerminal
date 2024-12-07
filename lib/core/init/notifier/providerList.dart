

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';

class ApplicationProvider {
  ApplicationProvider._init();
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  List<SingleChildWidget> singleItems = [];
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
        create: (context) =>dataStateNotifier()),

  ];
  List<SingleChildWidget> uiChangesItems = [];
}