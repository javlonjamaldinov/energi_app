import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:energi_app/src/presintation/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Импортируйте пакет

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false; // Состояние загрузки

  void _navigateWithLoading(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ButtomNavBar(),
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.black, AppColors.green],
                begin: const Alignment(-0.3, -1.0),
                end: const Alignment(0.7, 1.0),
                stops: const [0.7, 1.0],
              ),
            ),
            height: 100.h,
          ),
          Column(
            children: [
              SizedBox(height: 10.h),
              SizedBox(
                height: 50.h,
                child: Center(
                  child: SizedBox(
                    width: 80.w,
                    height: 45.h,
                    child: Image.asset('assets/icons/log.png'),
                  ),
                ),
              ),
              Text(
                "  ENJOY \nEVERY SIP",
                style: GoogleFonts.anton(
                  textStyle: TextStyle(
                    fontSize: 30.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "The ultimate refreshing drink \n    to enjoy in every festival",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 4.h),
              GestureDetector(
                onTap: () {
                  _navigateWithLoading(context);
                },
                child: Container(
                  height: 8.h,
                  width: 80.w,
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(20.sp),
                    border: Border.all(color: Colors.black, width: 0.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5.sp,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        "Refreshing Drink",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.sp,
                            color: AppColors.white,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_isLoading)
            Center(
              child: SpinKitFadingCircle(
                color: AppColors.white,
                size: 50.sp,
              ),
            ),
        ],
      ),
    );
  }
}
