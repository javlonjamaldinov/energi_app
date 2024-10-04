import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnergyWidgets extends StatelessWidget {
  const EnergyWidgets({
    super.key,
    required this.assetsName,
    required this.title,
    required this.price,
    required this.rating,
  });

  final String assetsName;
  final String title;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 50.w,
      child: Card(
        color: AppColors.white,
        elevation: 6, // Добавляет тень к Card
        shadowColor: Colors.black.withOpacity(0.3), // Цвет тени
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Закругленные углы
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 14.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icons/$assetsName'),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 10.w,
                      height: 3.h,
                      decoration: const BoxDecoration(
                        color: Color(0x7F404040),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(1),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 15,
                          ),
                          Text(
                            rating,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: 10,
                              fontFamily: 'Rosarivo',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontFamily: 'Rosarivo',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12.sp),
                    child: Text(
                      price,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: Container(
                      width: 13.w,
                      height: 5.h,
                      decoration: ShapeDecoration(
                        color: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
