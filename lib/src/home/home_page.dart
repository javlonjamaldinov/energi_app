import 'package:energi_app/src/helper/navigation_helper.dart';

import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:energi_app/src/presintation/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Импортируйте пакет

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false; // Состояние загрузки

  void _navigateWithLoading(BuildContext context) async {
    setState(() {
      _isLoading = true; // Включаем индикатор загрузки
    });

    // Имитация задержки в 5 секунд
    await Future.delayed(const Duration(seconds: 3));

    // Переход на экран после задержки
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ButtomNavBar(),
      ),
    );
    setState(() {
      _isLoading = false; // Выключаем индикатор загрузки
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Задний фон с градиентом
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.black, AppColors.green],
                begin: const Alignment(-0.3, -1.0),
                end: const Alignment(0.7, 1.0),
                stops: const [0.7, 1.0],
              ),
            ),
            height: 100.h, // Контейнер занимает весь экран
          ),

          // Основное содержимое экрана
          Column(
            children: [
              SizedBox(height: 10.h), // Отступ сверху
              SizedBox(
                height: 50.h, // Высота контейнера для изображения
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
                    color: AppColors.white, // Цвет текста на фоне градиента
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "The ultimate refreshing drink \n    to enjoy in every festival",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.white, // Цвет текста на фоне градиента
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 4.h), // Отступ сверху
              GestureDetector(
                onTap: () {
                  _navigateWithLoading(context); // Вызов метода с задержкой
                },
                child: Container(
                  height: 8.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: AppColors.white, // Цвет внешнего контейнера
                    borderRadius:
                        BorderRadius.circular(20.sp), // Закругленные углы
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Цвет тени
                        blurRadius: 5.sp, // Радиус размытия
                        offset: const Offset(0, 3), // Смещение тени
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2
                        .sp), // Отступы для создания эффекта "плавающего" контейнера
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.green, // Внутренний зеленый цвет
                        borderRadius:
                            BorderRadius.circular(20.sp), // Закругленные углы
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 25.w), // Отступ сверху
                          Text(
                            "Refreshing Drink",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white, // Цвет текста
                            ),
                          ),
                          SizedBox(width: 12.w), // Отступ сверху
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 3.sp),
                                child: Icon(
                                  Icons.arrow_forward_ios, // Первая иконка
                                  size: 16.sp,
                                  color: AppColors.white, // Цвет иконки
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 16.sp),
                                child: Icon(
                                  Icons.arrow_forward_ios, // Вторая иконка
                                  size: 15.sp,
                                  color: AppColors.white, // Цвет иконки
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Индикатор загрузки по центру экрана
          if (_isLoading)
            Center(
              child: SpinKitFadingCircle(
                color: AppColors.white,
                size: 50.sp, // Размер индикатора загрузки
              ),
            ),
        ],
      ),
    );
  }
}
