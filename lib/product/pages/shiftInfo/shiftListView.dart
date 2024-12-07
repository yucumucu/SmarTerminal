import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';
import 'package:smarterminal/product/pages/shiftInfo/shiftInfoMixin.dart';
import 'package:smarterminal/product/pages/shiftInfo/shiftView.dart';

class shiftListView extends StatefulWidget with shiftInfoMixin {
  const shiftListView({super.key});

  @override
  State<shiftListView> createState() => _shiftListViewState();
}

class _shiftListViewState extends State<shiftListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shift List'),
      ),
      body: Center(
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
    );
  }
}

Widget customListTile({required BuildContext context, required int index}) {
  final shiftListItemModel? model =
  context.watch<dataStateNotifier>().shiftListData[index];

  return ListTile(
    title: model != null ? Text(model.ad!) : Text("Shift $index"),
    subtitle: model != null ? Text(model.soyad!) : Text("Details unavailable"),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => shiftView(index: index),
        ),
      );
      // Add functionality for tap here if needed.

    },
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
