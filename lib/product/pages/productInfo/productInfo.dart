import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/productInfo/productInfoMixin.dart';
import 'package:smarterminal/product/pages/productInfo/productModel.dart';
import 'dart:math';
import 'package:mrx_charts/mrx_charts.dart';


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
        title: const Text("Ürün Bilgileri", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),


      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: productViewTopWidget(model: widget.model),),

            productInfoWidget(model: widget.model),
            SizedBox(height: 20),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.9,
                child: MonthlySalesChart(salesData: widget.model.yearlySale)),
            SizedBox(height: 20),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.9,
              child: CurrentMonthSales(salesData: widget.model.monthlySales)),
            SizedBox(height: 20),
          ],

        ),
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
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child:  Icon(
                  Icons.shopping_bag,
                  fill: 1.0,
                  size: MediaQuery.of(context).size.height * 0.15,
                )),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            SizedBox(width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                  model.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class productInfoWidget extends StatefulWidget with productInfoMixin {
  productModel model;
  productInfoWidget({super.key, required this.model});

  @override
  State<productInfoWidget> createState() => _productInfoWidgetState();
}

class _productInfoWidgetState extends State<productInfoWidget> {
  @override
  Widget build(BuildContext context) {

    double profitMargin =
        widget.model.purchasePrice == 0 ?  0 :  widget.model.salePrice / widget.model.purchasePrice;
    profitMargin = profitMargin * 100;

    //get 2 digit after comma
    profitMargin = double.parse((profitMargin).toStringAsFixed(2));


    double monthlyProfit = (widget.model.salePrice - widget.model.purchasePrice) * widget.model.monthlySale;

    monthlyProfit = double.parse((monthlyProfit).toStringAsFixed(2));



    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("Ürün Grubu: ${widget.model.group}"),
            leading: const Icon(Icons.shopping_bag),
          ),
          ListTile(
            title: Text("Satış Fiyat: ${widget.model.salePrice}"),
            leading: const Icon(Icons.attach_money),
            trailing: IconButton(onPressed: (){

              TextEditingController controller = TextEditingController(text: widget.model.salePrice.toString());

              //edit price and reload page
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text("Fiyat Değiştir"),
                  content: TextField(
                    controller: controller,
                  ),
                  actions: [
                    ElevatedButton(onPressed: (){

                      double newPrice = double.parse(controller.text);
                      setState(() {
                        widget.model.salePrice = newPrice;
                      });
                      print("new price: $newPrice");
                      print("model price: ${widget.model.salePrice}");
                      print(widget.model.id);

                      productInfoWidget(model: widget.model).editSalePrice(context,widget.model.id, widget.model.salePrice);
                      print("new price: $newPrice");
                      print("model price: ${widget.model.salePrice}");


                      Navigator.pop(context);

                    }, child: Text("Kaydet"))
                  ],
                );
              });

            }, icon: Icon(Icons.edit)),
          ),
          ListTile(
            title: Text("Alış Fiyat: ${widget.model.purchasePrice}"),
            leading: const Icon(Icons.money_off),
          ),
          ListTile(
            title: Text("Kar Oranı: % ${profitMargin}"),
            leading: const Icon(Icons.money),
          ),
          ListTile(
            title: Text("Aylık Satış: ${widget.model.monthlySale}"),
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





class MonthlySalesChart extends StatelessWidget {
  final List<int> salesData;

  MonthlySalesChart({required this.salesData}) {
    assert(salesData.length == 12, 'Sales data must have exactly 12 values.');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Chart(
        layers: [
          ChartAxisLayer(
            settings: ChartAxisSettings(
              x: ChartAxisSettingsAxis(
                frequency: 1.0,
                max: 12.0,
                min: 1.0,
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 10.0,
                ),
              ),
              y: ChartAxisSettingsAxis(
                frequency: 10.0,
                max: salesData.reduce(max).toDouble(),
                min: 0.0,
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 10.0,
                ),
              ),
            ),
            labelX: (value) {
              final months = [
                'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
              ];
              return months[value.toInt() - 1];
            },
            labelY: (value) => value.toInt().toString(),
          ),
          ChartBarLayer(
            items: List.generate(
              salesData.length,
                  (index) => ChartBarDataItem(
                color: const Color(0xFF8043F9),
                value: salesData[index].toDouble(),
                x: index + 1.0,
              ),
            ),
            settings: const ChartBarSettings(
              thickness: 8.0,
              radius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ],
      ),
    );
  }
}



class CurrentMonthSales extends StatelessWidget {
  final List<int> salesData;


  CurrentMonthSales({required this.salesData}) {
    assert(salesData.length == 30, 'Sales data must have exactly 30 values.');
  }

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Chart(
        layers: [
          ChartAxisLayer(
            settings: ChartAxisSettings(
              x: ChartAxisSettingsAxis(
                frequency: 5.0,
                max: 30.0,
                min: 1.0,
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 10.0,
                ),
              ),
              y: ChartAxisSettingsAxis(
                frequency: 10.0,
                max: salesData.reduce(max).toDouble(),
                min: 0.0,
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 10.0,
                ),
              ),
            ),
            labelX: (value) => value.toInt().toString(),
            labelY: (value) => value.toInt().toString(),
          ),
          ChartBarLayer(
            items: List.generate(
              salesData.length,
                  (index) => ChartBarDataItem(
                color: const Color(0xFF8043F9),
                value: salesData[index].toDouble(),
                x: index + 1.0,
              ),
            ),
            settings: const ChartBarSettings(
              thickness: 8.0,
              radius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ],
      ),
    );
  }
}
