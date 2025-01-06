import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/productInfo/productModel.dart';


class productInfo extends StatefulWidget {

  final productModel model;
  productInfo({super.key, required this.model});

  @override
  State<productInfo> createState() => _productInfoState();
}

class _productInfoState extends State<productInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Bilgileri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: productViewTopWidget(model: widget.model),),

          productInfoWidget(model: widget.model),
        ],

      ),
    );
  }
}

class productViewTopWidget extends StatelessWidget {
  productModel model;
  productViewTopWidget({super.key,required this.model});

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
                Icons.scatter_plot_rounded,
                size: 80,
              )),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          SizedBox(width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
                model.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
            ),
          ),
        ],
      ),
    );
  }
}



class productInfoWidget extends StatelessWidget {
  productModel model;
  productInfoWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    double profitMargin =
        model.purchasePrice == 0 ?  0 :  model.salePrice / model.purchasePrice;
    profitMargin = profitMargin * 100;


    double monthlyProfit = (model.salePrice - model.purchasePrice) * model.monthlySale;



    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("Ürün Grubu: ${model.group}"),
            leading: const Icon(Icons.shopping_bag),
          ),
          ListTile(
            title: Text("Satış Fiyat: ${model.salePrice}"),
            leading: const Icon(Icons.attach_money),
          ),
          ListTile(
            title: Text("Alış Fiyat: ${model.purchasePrice}"),
            leading: const Icon(Icons.money_off),
          ),
          ListTile(
            title: Text("Kar Oranı: % ${profitMargin}"),
            leading: const Icon(Icons.money),
          ),
          ListTile(
            title: Text("Aylık Satış: ${model.monthlySale}"),
            leading: const Icon(Icons.calendar_month_outlined),
          ),
          ListTile(
            title: Text("Aylık Kar: ${monthlyProfit}"),
            leading: const Icon(Icons.trending_up),
          ),

        ],
      ),
    );
  }
}
