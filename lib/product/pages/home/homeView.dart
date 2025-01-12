import 'dart:async';

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
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.floatingActionButtonColor,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),

        ),
        onPressed: () {
          Navigator.pushNamed(context, "/scanBarcodeView");
          // Add your onPressed code here!
        },
        child: const Icon(Icons.document_scanner_outlined),
      ),

      bottomNavigationBar: mainBottomNavBar(),

      body: Column(
        //design a main card at the top big and two small cards at the bottom use cardButton widget

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const AnimatedLetterText(),
            ),
          ),

          mainViewStatsCard(),
          Padding(padding: EdgeInsets.only(top: sizes().cardButtonPadding(context))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cardButton(
                title: "View Shits",
                routeName: "/shiftListView",
                icon: Icons.pending_actions,
                width: sizes().secondaryCardButtonWidth(context),
                height: sizes().secondaryCardButtonHeight(context),
              ),
              Padding(padding: EdgeInsets.only(left: sizes().cardButtonPadding(context))),
              cardButton(
                title: "Search Product",
                routeName: "/searchProductView",
                icon: Icons.search,
                width: sizes().secondaryCardButtonWidth(context),
                height: sizes().secondaryCardButtonHeight(context),
              ), 
            ],
          ),


        ],
      )
    );
  }
}

// This widget will only handle the animated text
class AnimatedLetterText extends StatefulWidget {
  const AnimatedLetterText({Key? key}) : super(key: key);

  @override
  State<AnimatedLetterText> createState() => _AnimatedLetterTextState();
}

class _AnimatedLetterTextState extends State<AnimatedLetterText> {
  final String fullText = "Kardeşler Market";
  String displayText = "";
  bool isDeleting = false;
  int charIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    displayText = fullText;
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 75), (timer) {
      if (mounted) {
        if (isDeleting) {
          if (charIndex < fullText.length) {
            displayText = fullText.substring(0, fullText.length - charIndex - 1);
            charIndex++;
          } else {
            isDeleting = false;
            charIndex = 0;
          }
        } else {
          if (charIndex < fullText.length) {
            displayText = fullText.substring(0, charIndex + 1);
            charIndex++;
          } else {
            isDeleting = true;
            charIndex = 0;
          }
        }
        // Only rebuild this specific widget
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayText,
      style: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
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
      backgroundColor: Colors.white,
      selectedItemColor: colors.mainNavbarColor,
      unselectedItemColor: Colors.grey,

      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: colors.mainNavbarColor,
      ),
      showUnselectedLabels: true,
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),



      items:  <BottomNavigationBarItem>[

        BottomNavigationBarItem(

          icon: IconButton(
              icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const homeView()));
            },
            color: colors.mainNavbarColor,
          ),
          label: 'Home',

        ),
        /*
        BottomNavigationBarItem(
          icon: Icon(
              Icons.table_chart,
            color:  colors.mainNavbarColor,
          ),
          label: 'Shifts',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.production_quantity_limits_sharp,
            color:  colors.mainNavbarColor,
          ),
          label: 'Products',
        ),

         */
        BottomNavigationBarItem(
          icon: Icon(
              Icons.account_box,
            color: colors.mainNavbarColor,
          ),
          label: 'Account',
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
    return MediaQuery.of(context).size.height * 0.5;
  }

  secondaryCardButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.44;
  }

  secondaryCardButtonHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.15;
  }

  thirdCardButtonWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9;
  }

  thirdCardButtonHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.1;
  }

  cardButtonPadding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.02;
  }

  cardButtonIconSize(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05;
  }


}


class colors{
  static const Color mainAppBarTextColor = Colors.white;
  static const Color circularProgressBarColor = Colors.purple;
  static const Color cardButtonIconColor = Colors.blue;
  Color cardButtonBackgroundColor = Colors.deepPurple;
  static const Color mainBackgroundColor = Colors.white;
  static const Color mainTextColor = Colors.black;
  static const Color mainNavbarColor = Colors.deepPurple;
  static const Color floatingActionButtonColor = Colors.blueGrey;
}

class mainViewStatsCard extends StatelessWidget {
  const mainViewStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side : BorderSide(color: colors.mainNavbarColor),
        borderRadius: BorderRadius.all(
            Radius.circular(10.0))
      ),

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
                    child:  CircularProgressIndicator(
                      strokeWidth: 4.0,
                    ));

              } else if (snapshot.connectionState == ConnectionState.done) {


                List<homeViewDataModel> data = context.watch<dataStateNotifier>().mainMenuStatsData;

                return Center(child: pieChartWidget(context, sizes().mainCardButtonWidth(context) *4/5  , sizes().mainCardButtonHeight(context) ));

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
            mainAxisAlignment: MainAxisAlignment.center,
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

    child: PieChart(


      dataMap: dataMap,
      colorList: [
        Colors.red,
        Colors.green,
        Colors.deepPurple,
        Colors.cyan,
      ],

      legendOptions: LegendOptions(
        legendTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold),
          legendPosition: LegendPosition.bottom
      ),

    )
  );
}

