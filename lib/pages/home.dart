import 'package:flutter/material.dart';
import 'package:technews/categories/bussiness.dart';
import 'package:technews/categories/entertainment.dart';
import 'package:technews/categories/general.dart';
import 'package:technews/categories/health.dart';
import 'package:technews/categories/science.dart';
import 'package:technews/categories/sports.dart';
import 'package:technews/categories/technology.dart';
import 'package:technews/utils/colors.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List> news;

  int selectedIndex = 0;

  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(  
        controller: pageController,
        children: [
          entertainment(),
          science(),
          bussiness(),
          general(),
          health(),
          sports(),
          technology(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(  
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.engineering) , label: 'Entertainment', backgroundColor: AppColors.black,),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science", backgroundColor: AppColors.black),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Bussiness", backgroundColor: AppColors.black),
          BottomNavigationBarItem(icon: Icon(Icons.notification_important), label: 'General', backgroundColor: AppColors.black),
          BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: 'Health', backgroundColor: AppColors.black),
          BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports', backgroundColor: AppColors.black),
          BottomNavigationBarItem(icon: Icon(Icons.do_not_disturb_on_total_silence_sharp), label: "Technology", backgroundColor: AppColors.black)
        ],
        currentIndex: selectedIndex,
        elevation: 1,
        showSelectedLabels: true,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withOpacity(0.7),
        onTap: onTapped,
        // backgroundColor: AppColors.black,
      ),
    );
  }
}