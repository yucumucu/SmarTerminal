import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/core/init/notifier/uiNotifier.dart';
import 'package:smarterminal/core/init/notifier/uiNotifier.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';
import 'package:smarterminal/product/pages/shiftInfo/shiftInfoMixin.dart';

import '../../../core/init/notifier/uiNotifier.dart';
import '../home/homeView.dart';


class shiftView extends StatelessWidget with shiftInfoMixin {
  final String id;
  final int index;

  shiftView({super.key, required this.id, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shift Details", style: TextStyle(color: Colors.white),),
        backgroundColor: colors.mainNavbarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section for Shift Information
              FutureBuilder(
                future: fetchSelectedShiftData(context, id, index),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    final model = context.watch<dataStateNotifier>().selectedShiftData;

                    if (model == null) {
                      return const Center(
                        child: Text(
                          "Failed to load selected shift. Please try again.",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: shiftViewUserWidget(model: model),
                        ),
                        shiftInfoWidget(model: model),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        "Failed to load selected shift. Please try again.",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return const Center(
                    child: Text("An unknown error occurred."),
                  );
                },
              ),

              const SizedBox(height: 16),


              Text("Tap to view sales data", style: TextStyle(color: Colors.grey, fontSize: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Text("Product Name"),
                  const Text("Sale Amount")
                ]
              ),
              // Bottom Section for Sales Data
              GestureDetector(
                onTap: () {
                  context.read<uiNotifier>().changeSalesDataVisibility();
                },
                child: FutureBuilder(
                  future: fetchSelectedShiftSalesData(context, id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      );
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      List<shiftViewSalesModel> data = context.watch<dataStateNotifier>().selectedShiftSalesData;

                      if (data == null || data.isEmpty) {
                        return const Center(
                          child: Text(
                            "Sales List is empty or failed to load.",
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }

                      final displayedData = data.toList(); // You can filter or manipulate data here

                      return AnimatedContainer(
                        color: Colors.grey[200],
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.builder(
                          shrinkWrap: true, // Allows ListView to size itself
                          physics: const NeverScrollableScrollPhysics(), // Disable scroll for the nested ListView
                          itemCount: context.watch<uiNotifier>().isSalesOfShiftWidgetExtended ? displayedData.length : 2,
                          itemBuilder: (context, index) {
                            final sale = displayedData[index];
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(

                                children: [
                                  ListTile(
                                    style: ListTileStyle.drawer,
                                  title: Text(sale.productName, style: const TextStyle(color: Colors.black)),
                                  trailing: Text(sale.amount.toString()),
                                ),
                                  LinearProgressIndicator(
                                    value: sale.amount / 100,
                                    backgroundColor: Colors.grey[500],
                                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                                  ),
                                ]
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          "Failed to load sales data. Please try again.",
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const Center(
                      child: Text("An unknown error occurred."),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class shiftViewUserWidget extends StatelessWidget {
  selectedShiftDataModel model;
  shiftViewUserWidget({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
              child: const Icon(
                  Icons.person_2_outlined,
                  size: 80,
              )),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          SizedBox(width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                  model.ad.toString() + " " + model.soyad.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ),
          ),
        ],
      ),
    );
  }
}

class shiftInfoWidget extends StatelessWidget {
  selectedShiftDataModel model;
  shiftInfoWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("Tarih: ${model.tarih}"),
            subtitle: Text("Saat: ${model.saat}"),
            leading: const Icon(Icons.calendar_today),
          ),
          ListTile(
            title: Text("Satis Toplam: ${model.satisToplam}"),
            subtitle: Text("Fark: ${model.fark}"),
            leading: const Icon(Icons.attach_money),
          ),
          ListTile(
            title: Text("Iade Toplam: ${model.iadeToplam}"),
            subtitle: Text("Veresiye Toplam: ${model.veresiyeToplam}"),
            leading: const Icon(Icons.money_off),
          ),
          ListTile(
            title: Text("Pos Toplam: ${model.posToplam}"),
            subtitle: Text("Nakte Toplam: ${model.nakteStop}"),
            leading: const Icon(Icons.money),
          ),
          ListTile(
            title: Text("Gelir Toplam: ${model.gelirToplam}"),
            subtitle: Text("Gider Toplam: ${model.giderToplam}"),
            leading: const Icon(Icons.monetization_on),
          ),
          ListTile(
            title: Text("Musteri Sayisi: ${model.musteriSayisi}"),
            leading: const Icon(Icons.people),
          ),
          ListTile(
            title: Text("Toplam Kâr: " + (model.gelirToplam - model.giderToplam).toString()),
            leading: const Icon(Icons.trending_up),
          )
        ],
      ),
    );
  }
}



