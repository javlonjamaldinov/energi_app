import 'package:energi_app/src/home/home_page.dart';
import 'package:energi_app/src/presintation/screen/home_screen.dart';
import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  _ButtomNavBarState createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BottomAppBar(
          elevation: 1,
          height: 70,
          color: AppColors.lightGrey,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home_filled,
                  color: currentIndex == 0 ? AppColors.green : AppColors.greyL,
                  size: 30,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.search_sharp,
                  color: currentIndex == 1 ? AppColors.green : AppColors.greyL,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.bookmark_outline,
                  color: currentIndex == 2 ? AppColors.green : AppColors.greyL,
                  size: 30,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 3 ? AppColors.green : AppColors.greyL,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
