import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:search_bar_code/searchbarScreen.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _SearchBarScreenState();
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    bottom: const TabBar(
      labelPadding: EdgeInsets.symmetric(horizontal: 14),
      indicator: BoxDecoration(),
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
      labelColor: Colors.white,
      tabs: [

        Text("সকল দোয়া সমূহ",textAlign: TextAlign.center,),
        Text("মুসলিম মেয়েদের নাম সমূহ",textAlign: TextAlign.center),
        Text("মুসলিম ছেলেদের নাম সমূহ",textAlign: TextAlign.center),
      ],
    ),
    backgroundColor:Color.fromARGB(255, 70, 138, 89),
    elevation: 0.0,
    centerTitle: true,
    title: const Column(
      children: [
        Text(
          "All Dua",
          style: TextStyle(color: Colors.white),
        ),
       
      ],
      
    ),
    // actions: [
    //   IconButton(
    //     icon: SvgPicture.asset(
    //       'assets/Search.svg',color: Colors.white,
    //       width: 30,
    //     ),
    //     onPressed: () {},
    //   ),
    // ],
  );
}
class _SearchBarScreenState extends State<TabbarScreen> {
 
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, 
    child: Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                Center(
                  child: Text('')
                ),
                const Center(child: 
                SearchBarScreen()
                ),
                const Center(child: Text("")),
              ],
            ),
          ),

    ),
    
    );
  }
}