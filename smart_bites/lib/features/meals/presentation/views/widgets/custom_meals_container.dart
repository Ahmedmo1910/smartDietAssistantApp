// ignore: file_names
import 'package:flutter/material.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';

// ignore: camel_case_types
class CustomMealsContainer extends StatelessWidget {
  final Widget imageUrl;
  final String cardName;
  final List<String> cardDescription;

  const CustomMealsContainer({
    super.key,
    required this.imageUrl,
    required this.cardName,
    required this.cardDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(1, 2),
              blurRadius: 2,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(20), child: imageUrl),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(cardName, style: AppTextStyles.semiBold14),
                    const SizedBox(height: 4),
                    Text(
                      cardDescription.join(",\n"),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular12.copyWith(
                        // color: Colors.black45,
                      ),
                    ),
                    // const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
