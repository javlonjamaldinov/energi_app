import 'package:energi_app/src/helper/navigation_helper.dart';
import 'package:energi_app/src/presintation/screen/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:energi_app/src/presintation/ui/theme/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, });

  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {
  String selectedCard = 'MasterCard';
  bool isCardSaved = true;
  bool _isLoading = false;

  // Пример продукта, вы можете заменить его на свой продукт
  final Map<String, dynamic> product = {
    'price': 16.48, // цена за единицу
    'quantity': 2, // количество
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _isLoading
          ? Center(
              child: SpinKitFadingCircle(
                color: AppColors.grey,
                size: 50.sp,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColors.black,
                          size: 3.h,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.search,
                        color: AppColors.black,
                        size: 3.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Order summary',
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  _buildOrderSummary(),
                  SizedBox(height: 2.h),
                  _buildPaymentMethods(),
                  const Spacer(),
                  _buildTotalPriceSection(),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
    );
  }

  Widget _buildOrderSummary() {
    double totalPrice = product['price'] * product['quantity']; // Общая цена

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSummaryRow('Order', '\$${totalPrice.toStringAsFixed(2)}'),
        _buildSummaryRow('Taxes', '\$0.3'),
        _buildSummaryRow('Delivery fees', '\$1.5'),
        const Divider(),
        _buildSummaryRow(
          'Total:',
          '\$${(totalPrice + 0.3 + 1.5).toStringAsFixed(2)}', // Итого с учетом налогов и доставки
          isBold: true,
          textSize: 18.sp,
        ),
        SizedBox(height: 1.h),
        Text(
          'Estimated delivery time: 15 - 30mins',
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value,
      {bool isBold = false, double textSize = 16}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: textSize.sp,
              color: AppColors.grey,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: textSize.sp,
              color: AppColors.grey,
              fontWeight: isBold ? FontWeight.w900 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment methods',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 2.h),
        _buildCardMethod(
          'MasterCard',
          '5105 **** **** 0505',
          'assets/icons/mast.png',
        ),
        SizedBox(height: 1.h),
        _buildCardMethod(
          'Visa',
          '3566 **** **** 0505',
          'assets/icons/visa.png',
        ),
        SizedBox(height: 1.h),
        Row(
          children: [
            Checkbox(
              value: isCardSaved,
              onChanged: (value) {
                setState(() {
                  isCardSaved = value ?? false;
                });
              },
              activeColor: AppColors.red,
            ),
            Text(
              'Save card details for future payments',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardMethod(
      String cardType, String cardNumber, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCard = cardType;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
          color:
              selectedCard == cardType ? AppColors.brown : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 10.w,
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardType,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: selectedCard == cardType
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                Text(
                  cardNumber,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: selectedCard == cardType
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              selectedCard == cardType
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: selectedCard == cardType
                  ? AppColors.lightGrey
                  : AppColors.brown,
              size: 3.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalPriceSection() {
    double totalPrice = product['price'] * product['quantity']; // Общая цена

    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total price',
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${(totalPrice + 0.3 + 1.5).toStringAsFixed(2)}', // Итого с учетом налогов и доставки
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brown,
              padding: EdgeInsets.symmetric(vertical: 2.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              setState(() {
                _isLoading = true;
              });

              await Future.delayed(const Duration(seconds: 2));

              setState(() {
                _isLoading = false;
              });

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessScreen(),
                  ));
            },
            child: Text(
              'Pay Now',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
