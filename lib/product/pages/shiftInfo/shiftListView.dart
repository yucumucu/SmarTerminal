import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';
import 'package:smarterminal/product/pages/shiftInfo/shiftInfoMixin.dart';
import 'package:smarterminal/product/pages/shiftInfo/shiftView.dart';

import '../home/homeView.dart';

class shiftListView extends StatefulWidget with shiftInfoMixin {
   shiftListView({super.key});

  @override
  State<shiftListView> createState() => _shiftListViewState();
}

class _shiftListViewState extends State<shiftListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.mainNavbarColor,
        title: const Text('Shift List', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: shiftListView().fetchShiftList(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(
                  color: Colors.green,
                );
              } else if (snapshot.connectionState == ConnectionState.done) {

                return customShiftListWidget(context: context);
              } else if (snapshot.hasError) {
                return const Text("Failed to load shifts. Please try again.");
              }
              return const Text("An unknown error occurred.");
            },
          ),
        ),
      ),
    );
  }
}

Widget customListTile({required BuildContext context, required int index}) {
  final shiftListItemModel? model =
  context.watch<dataStateNotifier>().shiftListData[index];

  return Padding(
    padding: EdgeInsets.all(1.0),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,

      child: Card(
        color: model!.fark >= 0 ? Colors.green: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(child: customListTileBox(context, model))
      ),
    ),
  );
}

Widget customListTileBox(BuildContext context, shiftListItemModel model) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.height * 0.06,
                                   ),
                 ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.ad!),
                    Text(model.soyad!),
                  ],
                )
              ]
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(
                    Icons.calendar_today,
                    size: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.tarih!),
                      Text(model.saat!),
                    ],
                  ),
                )
              ]
            )
          ],
        ),
          
        
        
      ]
    ),
    
  );
}

Widget customShiftListWidget({required BuildContext context}) {
  final bool isLoading = context.watch<dataStateNotifier>().shiftListDataLoading;

  if (isLoading) {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }

  final shiftData = context.watch<dataStateNotifier>().shiftListData;

  if (shiftData.isEmpty) {
    return const Center(
      child: Text("No shifts available."),
    );
  }

  return ListView.builder(
    itemCount: shiftData.length,
    itemBuilder: (context, index) {
      return customListTile(context: context, index: index);
    },
  );
}
