import 'package:energi_app/src/data/model/product_model.dart';
import 'package:energi_app/src/helper/navigation_helper.dart';
import 'package:energi_app/src/presintation/ui/BottomSheet/bottom_sheet.dart';
import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:energi_app/src/presintation/widgets/inergy_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:energi_app/src/view/product_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Icon(
                  Icons.align_horizontal_left_rounded,
                  color: AppColors.black,
                  size: 3.h,
                ),
                SizedBox(width: 81.w),
                Icon(
                  Icons.search,
                  color: AppColors.black,
                  size: 3.h,
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 25.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [AppColors.black, AppColors.green],
                          begin: const Alignment(-0.2, -1.0),
                          end: const Alignment(0.6, 1.0),
                          stops: const [0.5, 1.0],
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.only(right: 50.sp),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 25.sp),
                                  child: Text(
                                    "30% Off",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Padding(
                            padding: EdgeInsets.only(left: 25.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "The Holi \nOffer",
                                  style: GoogleFonts.anton(
                                    textStyle: TextStyle(
                                      fontSize: 20.sp,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 90.h,
                                    child: ListView(
                                      children: const [MyBottomSheet()],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 50.sp),
                              child: Container(
                                height: 4.h,
                                width: 25.w,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 15.sp,
                      bottom: 0,
                      child: Image.asset(
                        'assets/icons/lit.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(
                                milliseconds: 400), // Длительность анимации
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return ProductView(
                                  product:
                                      product); // Страница, которая открывается
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin =
                                  Offset(0.0, 1.0); // Начальная позиция (снизу)
                              const end =
                                  Offset.zero; // Конечная позиция (по центру)
                              const curve = Curves.ease; // Кривая анимации

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: EnergyWidgets(
                        assetsName: productData[index]['assetsName'],
                        title: productData[index]['title'],
                        price: productData[index]['price'],
                        rating: productData[index]['rating'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
