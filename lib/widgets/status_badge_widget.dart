import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusBadgeWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const StatusBadgeWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 11,
  });

  factory StatusBadgeWidget.category(BuildContext context, String category) {
    final theme = Theme.of(context);
    Color bg;
    switch (category.toLowerCase()) {
      case 'handicrafts':
        bg = const Color(0xFF8B5E3C);
        break;
      case 'pottery':
        bg = const Color(0xFFC17A3A);
        break;
      case 'clothing':
        bg = const Color(0xFF7A5C8A);
        break;
      case 'organic food':
        bg = const Color(0xFF4A7C59);
        break;
      case 'paintings':
        bg = const Color(0xFF3A6B8A);
        break;
      case 'home decor':
        bg = const Color(0xFFB85C4A);
        break;
      default:
        bg = theme.colorScheme.primary;
    }
    return StatusBadgeWidget(
      label: category,
      backgroundColor: bg.withAlpha(230),
      textColor: Colors.white,
    );
  }

  factory StatusBadgeWidget.village(BuildContext context, String village) {
    return StatusBadgeWidget(
      label: '📍 $village',
      backgroundColor: Colors.black.withAlpha(140),
      textColor: Colors.white,
      fontSize: 10,
    );
  }

  factory StatusBadgeWidget.handmade(BuildContext context) {
    return StatusBadgeWidget(
      label: '✦ Handmade',
      backgroundColor: const Color(0xFF4A7C59).withAlpha(220),
      textColor: Colors.white,
      fontSize: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.dmSans(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
