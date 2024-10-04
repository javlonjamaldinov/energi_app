import 'package:energi_app/src/helper/navigation_helper.dart';
import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Это важно для ограничения высоты Column
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 76.sp,
                    top: 10.sp,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('Close button tapped');
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                ),
                // Здесь можно добавить другие виджеты в вашем BottomSheet
              ],
            ),
            Positioned(
              bottom: -70.sp,
              right: 15.sp,
              child: Image.asset(
                'assets/icons/lit3.png',
              ),
            ),
          ],
        ),
        SizedBox(height: 73.sp),
        Padding(
          padding: EdgeInsets.only(
            right: 62.sp,
          ),
          child: Text(
            'Cool Berry',
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 10.sp),
        Row(
          children: [
            SizedBox(width: 5.w),
            Icon(
              Icons.star,
              color: AppColors.yellow,
            ),
            SizedBox(width: 5.w),
            Text(
              '5.0',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              '(2343 Reviews)',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.sp),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
          ),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text:
                      'The fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing taste ',
                  style: TextStyle(
                    color: AppColors.grey, // Цвет для "Customize"
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: '... Read more',
                  style: TextStyle(
                    color: AppColors.green, // Цвет для остального текста
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.sp),
        // Offers section
        Container(
          color: Colors.green.shade50,
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                  ),
                  SizedBox(width: 10.sp),
                  Text(
                    'Code TRYNEW applied!',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '-₹50.00',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  GestureDetector(
                    onTap: () {
                      // Логика для удаления кода предложения
                    },
                    child: Text(
                      'Remove',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.sp),
              Text(
                '25% off up to ₹100',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp),
        // Size section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  _buildSizeOption('Can', true),
                  _buildSizeOption('300 ml', false),
                  _buildSizeOption('1 ltr', false),
                  _buildSizeOption('2 ltr', false),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp),
        // Price and Add to cart button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Row(
            children: [
              Text(
                '₹100',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                      navigateToScreen(context, 1); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.sp,
                    vertical: 10.sp,
                  ),
                ),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.sp),
      ],
    );
  }

  Widget _buildSizeOption(String label, bool selected) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: GestureDetector(
        onTap: () {
          // Логика выбора размера
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          decoration: BoxDecoration(
            border: Border.all(
              color: selected ? AppColors.green : AppColors.grey,
            ),
            borderRadius: BorderRadius.circular(20.sp),
            color: selected ? Colors.green.shade50 : Colors.transparent,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              color: selected ? AppColors.green : AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
