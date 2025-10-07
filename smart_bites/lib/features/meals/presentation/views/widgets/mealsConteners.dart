// ignore: file_names
import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';

// ignore: camel_case_types
class mealsContainers extends StatelessWidget {
  final String imageUrl;
  final String cardName;
  final String cardDescription;
  final String buttonText;
  final String routeName;

  const mealsContainers({
    super.key,
    required this.imageUrl,
    required this.cardName,
    required this.cardDescription,
    required this.buttonText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.17,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(1, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                height: MediaQuery.of(context).size.height * 0.17,
                width: 118,
                fit: BoxFit.fill,
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(cardName, style: AppTextStyles.bold18),
                const SizedBox(height: 4),
                Text(
                  cardDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular14.copyWith(
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 8),
                MainButton(
                  text: buttonText,
                  onTap: () {
                    Navigator.pushNamed(context, routeName);
                  },
                  width: 170,
                  height: 40,
                  hasCircularBorder: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
