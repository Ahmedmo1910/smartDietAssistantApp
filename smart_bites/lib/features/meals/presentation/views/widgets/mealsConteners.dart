// ignore: file_names
import 'package:flutter/material.dart';
import 'package:smart_bites/features/home/presentation/views/widgets/custom_button.dart';

// ignore: camel_case_types
class mealsContainers extends StatelessWidget {
  final String imageUrl;
  final String cardName;
  final String cardDescription;
  final String buttonText;

  const mealsContainers({
    super.key,
    required this.imageUrl,
    required this.cardName,
    required this.cardDescription,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageUrl,
                  height: 110,
                  width: 90,
                  fit: BoxFit.fill,
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      cardName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      cardDescription,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    MainButton(
                      text: buttonText,
                      onTap: () {},
                      width: 190,
                      height: 40,
                      hasCircularBorder: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
