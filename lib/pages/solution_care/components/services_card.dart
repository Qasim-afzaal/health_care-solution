import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String? backgroundColor;
  final Color textColor;
  final String? borderColor;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundColor!),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  scale: 1.8,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    description,
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: textColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/arrow.png"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
