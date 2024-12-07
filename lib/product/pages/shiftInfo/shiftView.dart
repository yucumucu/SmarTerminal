import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/product/pages/shiftInfo/models.dart';
import 'package:smarterminal/product/pages/shiftInfo/shiftInfoMixin.dart';

class shiftView extends StatelessWidget with shiftInfoMixin {

  int index;
  shiftView({super.key, required this.index });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: shiftView(index: index).fetchSelectedShiftData(context, index),
          builder: (context, snapshot) {
        
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.green,
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
        
        
              selectedShiftDataModel? model = context.watch<dataStateNotifier>().selectedShiftData;
        
              if(model == null){
                return const Text("Failed to load selected shift. Please try again.");
              }
        
              /*
        
                String tarih;
                String saat;
                String ad;
                String soyad;
                double satisToplam;
                double fark;
                double iadeToplam;
                double veresiyeToplam;
                double posToplam;
                double nakteStop;
                double giderToplam;
                double gelirToplam;
                int musteriSayisi;
        
               */
        
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Shift $index"),
                  Text("Ad: ${model.ad}"),
                  Text("Soyad: ${model.soyad}"),
                  Text("Tarih: ${model.tarih}"),
                  Text("Saat: ${model.saat}"),
                  Text("Satis Toplam: ${model.satisToplam}"),
                  Text("Fark: ${model.fark}"),
                  Text("Iade Toplam: ${model.iadeToplam}"),
                  Text("Veresiye Toplam: ${model.veresiyeToplam}"),
                  Text("Pos Toplam: ${model.posToplam}"),
                  Text("Nakte Stop: ${model.nakteStop}"),
                  Text("Gider Toplam: ${model.giderToplam}"),
                  Text("Gelir Toplam: ${model.gelirToplam}"),
                  Text("Musteri Sayisi: ${model.musteriSayisi}"),
        
        
        
                ],
              );
        
            } else if (snapshot.hasError) {
              return const Text("Failed to load selected shift. Please try again.");
            }
            else {
              return const Text("An unknown error occurred.");
            }
        
        },),
      )

    );
  }
}
