import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_colors.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/icon_and_button.dart';
import 'package:smart_bites/features/meals%20description/presentation/views/widgets/tabbed_container.dart';

class MealsDescWidget extends StatelessWidget {
  const MealsDescWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.87,
      child: Stack(
        children: [
          Positioned(
            top: 237,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.575,
              decoration: BoxDecoration(
                color: Color(0XFFE8F2DA),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(44),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),

              child: Padding(
                padding: const EdgeInsets.only(
                  top: 48,
                  right: 8,
                  left: 8
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omelette with Vegetables',
                      style: AppTextStyles.regular20,
                    ),

                    SizedBox(height: 4.0),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Kcal:',
                            style: AppTextStyles.regular20.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' 250',
                            style: AppTextStyles.bold20.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    TabbedContainer(),
                    SizedBox(height: 12.0),
                    IconAndButton(),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 140,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/omlett.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'Omelette with vegetables, like other types of omelette. Was originally created by mixing eggs with onions, tomatoes, mushrooms, and peppers, then cooked in a hot pan with butter.',

//                             style: TextStyle(
//                               fontSize: 15.4,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
