import 'package:energi_app/src/presintation/screen/cart_screen.dart';
import 'package:energi_app/src/presintation/screen/home_screen.dart';
import 'package:energi_app/src/presintation/screen/success_screen.dart';
import 'package:energi_app/src/view/product_view.dart';
import 'package:flutter/material.dart';

void navigateToScreen(BuildContext context, int index) {
  print('Navigating to index: $index');

  final routes = [
    HomeScreen(),
    const CartScreen(
      
    ),
    const SuccessScreen(),
     
  ];

  final pageRouteBuilder = PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => routes[index],
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );

  Navigator.push(context, pageRouteBuilder);
}
