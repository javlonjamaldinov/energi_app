import 'package:energi_app/src/data/purchase_status_notifier.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:energi_app/src/data/users/user_pre_ferences.dart';
import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 40.h,
              width: 80.w,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 47,
                    offset: Offset(0, 19),
                    spreadRadius: -8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.sp,
                    backgroundColor: AppColors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 25.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Your payment was successful. \n A receipt for this purchase has \n been sent to your email.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {
                      // Сохраняем статус покупки и обновляем его через поток
                      UserPreferences.savePurchaseStatus(true);
                      purchaseStatusNotifier
                          .updateStatus(true); // Обновляем статус

                      // Отображаем кастомное сообщение в верхней части экрана
                      _showTopNotification(context, 'Спасибо за покупку!');

                      // Возвращаемся на предыдущий экран через 2 секунды
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Go Back',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTopNotification(BuildContext context, String message) {
    // Создаем OverlayEntry для кастомного уведомления
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 20, // Отступ сверху
        left: 20,
        right: 20,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(20.sp),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.sp),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );

    // Вставляем OverlayEntry в Overlay
    overlay.insert(overlayEntry);

    // Убираем уведомление через 2 секунды
    Future.delayed(const Duration(seconds: 5), () {
      overlayEntry.remove();
    });
  }
}
