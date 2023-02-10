import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:file_templeate/screen/sponsor/HomePageSponsor.dart';
import 'package:file_templeate/screen/homePage/show/showServicePlanner.dart';
import 'package:file_templeate/screen/homePage/show/showPackagPlanner.dart';
import 'package:file_templeate/screen/homePage/show/showorder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Auth/signin.dart';
import 'show/Favorite.dart';
import 'homepage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final screens = [
    HomePageSponsor(),
    ShowOrder(),
    Favorite(),
    HomePageService(),
    HomePagePackage(),
  ];

  final _pageController = PageController(initialPage: 4);
  int maxCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black87,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.exit_to_app),
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         Get.to(() => Signin());
      //       },
      //     ),
      //   ],
      // ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(screens.length, (index) => screens[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (screens.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: true,
              notchColor: Color.fromARGB(197, 143, 34, 170),
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 35, 49, 140),
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 244, 244, 245),
                  ),
                  itemLabel: 'الممولين',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.my_library_books,
                    color: Color.fromARGB(255, 35, 49, 140),
                  ),
                  activeItem: Icon(
                    Icons.my_library_books,
                    color: Color.fromARGB(255, 244, 244, 245),
                  ),
                  itemLabel: 'الطلبات',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.favorite_border,
                    color: Color.fromARGB(255, 35, 49, 140),
                  ),
                  activeItem: Icon(
                    Icons.favorite,
                    color: Color.fromARGB(255, 244, 244, 245),
                  ),
                  itemLabel: 'المفضلة',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.shop_2_outlined,
                    color: Color.fromARGB(255, 35, 49, 140),
                  ),
                  activeItem: Icon(
                    Icons.shop_2_outlined,
                    color: Colors.white,
                  ),
                  itemLabel: 'الخدمه',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 35, 49, 140),
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  itemLabel: ' الخدمات',
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}
