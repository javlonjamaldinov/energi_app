import 'package:energi_app/src/data/model/product_model.dart';
import 'package:energi_app/src/helper/navigation_helper.dart';
import 'package:energi_app/src/presintation/screen/cart_screen.dart'; // Импортируем CartScreen
import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Импортируем пакет для анимации

class ProductView extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductView({super.key, required this.product});

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int quantity = 1; // Начальное количество продукта
  bool isLoading = false; // Состояние загрузки
  int cartItemCount = 0; // Количество товаров в корзине

  @override
  Widget build(BuildContext context) {
    double price = double.tryParse(
            widget.product['price'].toString().replaceAll('₹', '').trim()) ??
        0.0; // Преобразуем цену в double
    double totalPrice = price * quantity; // Общая цена

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded, size: 2.5.h),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.settings, size: 2.5.h),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              // Отображаем только выбранный продукт
              Column(
                children: [
                  Image.asset(
                    'assets/icons/${widget.product['assetsName']}',
                    height: 30.h,
                    width: 30.h,
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product['title'],
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 45.sp),
                        child: const Icon(Icons.star, color: Colors.yellow),
                      ),
                      Text(
                        widget.product['rating'].toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  // Отображение цены или общей цены
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quantity > 1
                            ? 'Итого: ₹${totalPrice.toStringAsFixed(2)}'
                            : 'Цена: ${widget.product['price']}',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: quantity > 1 ? Colors.green : Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.sp),
                        child: Container(
                          height: 7.h,
                          width: 30.w,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  size: 20.sp,
                                  color: AppColors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  });
                                },
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 20.sp,
                                  color: AppColors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 23.sp),
                        child: const Icon(Icons.location_on_sharp),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
              Text(
                widget.product['description'],
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      cartItemCount += quantity; // Обновляем количество товаров в корзине
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                    setState(() {
                      isLoading = false; // Выключаем состояние загрузки
                    });
                  });
                },
                child: Container(
                  height: 8.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColors.green,
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
                  child: Center(
                    child: isLoading
                        ? SpinKitFadingCircle(
                            color: AppColors.white,
                            size: 30.sp, // Размер индикатора загрузки
                          )
                        : Text(
                            "place an order",
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
