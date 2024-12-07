import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:smarterminal/core/init/notifier/dataStateNotifier.dart';
import 'package:smarterminal/core/init/notifier/providerList.dart';
import 'package:smarterminal/product/pages/home/homeViewMixin.dart';
import 'package:smarterminal/product/pages/home/model.dart';

class homeView extends StatefulWidget with homeViewMixin{
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),

      bottomNavigationBar: mainBottomNavBar(),

      body: Column(
        //design a main card at the top big and two small cards at the bottom use cardButton widget

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mainViewStatsCard(),
          Padding(padding: EdgeInsets.only(top: sizes().cardButtonPadding(context))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cardButton(
                title: "Scan Barcode",
                routeName: "/scanBarcodeView",
                icon: Icons.chrome_reader_mode_outlined,
                width: sizes().secondaryCardButtonWidth(context),
                height: sizes().secondaryCardButtonHeight(context),
              ),
              Padding(padding: EdgeInsets.only(left: sizes().cardButtonPadding(context))),
              cardButton(
                title: "Search Product",
                routeName: "/searchProductView",
                icon: Icons.tab,
                width: sizes().secondaryCardButtonWidth(context),
                height: sizes().secondaryCardButtonHeight(context),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: sizes().cardButtonPadding(context))),
          cardButton(
            title: "See Shifts",
            routeName: "/shiftListView",
            icon: Icons.settings,
            width: sizes().thirdCardButtonWidth(context),
            height: sizes().thirdCardButtonHeight(context),
          ),

        ],
      )
    );
  }
}

class mainBottomNavBar extends StatelessWidget {
  const mainBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black12,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,

      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.green,
      ),
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),



      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
              Icons.home,
            color: Colors.green,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.table_chart,
            color: Colors.green,
          ),
          label: 'Shifts',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.production_quantity_limits_sharp,
            color: Colors.green,
          ),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.account_box,
            color: Colors.green,
          ),
          label: 'Accounts',
        ),
      ],
    );
  }
}

class sizes{

  mainCardButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9;
  }

  mainCardButtonHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.4;
  }

  secondaryCardButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.4;
  }

  secondaryCardButtonHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.2;
  }

  thirdCardButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9;
  }

  thirdCardButtonHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.05;
  }

  cardButtonPadding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05;
  }

  cardButtonIconSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05;
  }


}


class colors{
  static const Color mainAppBarTextColor = Colors.white;
  static const Color circularProgressBarColor = Colors.blue;
  static const Color cardButtonIconColor = Colors.blue;
  Color cardButtonBackgroundColor = Colors.green;
}

class mainViewStatsCard extends StatelessWidget {
  const mainViewStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: SizedBox(
        width: sizes().mainCardButtonWidth(context),
        height: sizes().mainCardButtonHeight(context),

        child: FutureBuilder(
            future: homeView().fetchHomeViewStatsData(context),
            builder: (context, snapshot){

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                    width: 10,
                    height: 10,
                    child:  CircularProgressIndicator());

              } else if (snapshot.connectionState == ConnectionState.done) {
                print("Home view stats data loaded successfully.");

                List<homeViewDataModel> data = context.watch<dataStateNotifier>().mainMenuStatsData;

                return Row(
                  children: [

                    pieChartWidget(context, sizes().mainCardButtonWidth(context) , sizes().mainCardButtonHeight(context) ),
                  ],
                );

              } else{
                return const Text("Failed to load home view stats. Please try again.");
              }
            }),
      )
    );
  }
}



class cardButton extends StatelessWidget {

  final String title;
  final String routeName;
  final IconData icon;
  final double width;
  final double height;

  const cardButton({super.key,
    required this.title,
    required this.routeName,
    required this.icon,
    required this.width,
    required this.height

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ,
      child: GestureDetector(
        onTap: (){
          if (routeName != "/homeView") {
            Navigator.pushNamed(context, routeName);
          }
        },
        child: Card(
          color: colors().cardButtonBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(left: sizes().cardButtonPadding(context))),
              Icon(
                icon,
                color: colors.mainAppBarTextColor,
                size: sizes().cardButtonIconSize(context
                ),
              ),
              Padding(padding: EdgeInsets.only(left: sizes().cardButtonPadding(context))),
              Text(
                title,
                style: TextStyle(
                    color: colors.mainAppBarTextColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold
                ),)
            ],
          ),

        ),
      ),

    );
  }
}

Widget pieChartWidget(BuildContext context, double width, double height){

  List<homeViewDataModel> data = context.watch<dataStateNotifier>().mainMenuStatsData;
  Map<String, double> dataMap = {};
  for (int i = 0; i < data.length; i++){
    dataMap[data[i].categoryName] = data[i].categoryPercentage;
  }

  return SizedBox(
    width: width,
    height: height,

    child: PieChart(dataMap: dataMap )
  );
}

