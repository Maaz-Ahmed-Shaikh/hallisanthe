import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';

class HeroHeadlineWidget extends StatelessWidget {
  const HeroHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Handmade\n',
                  style: GoogleFonts.dmSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.onSurfaceLight,
                    height: 1.15,
                    letterSpacing: -0.8,
                  ),
                ),
                TextSpan(
                  text: 'with ',
                  style: GoogleFonts.dmSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.onSurfaceLight,
                    height: 1.15,
                    letterSpacing: -0.8,
                  ),
                ),
                TextSpan(
                  text: 'Heart',
                  style: GoogleFonts.dmSans(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primary,
                    height: 1.15,
                    letterSpacing: -0.8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Discover authentic village crafts from Karnataka',
            style: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.mutedLight,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          // Stats row
          Row(
            children: [
              _StatPill(
                value: '240+',
                label: 'Artisans',
                color: AppTheme.primary,
              ),
              const SizedBox(width: 8),
              _StatPill(
                value: '18',
                label: 'Villages',
                color: AppTheme.secondary,
              ),
              const SizedBox(width: 8),
              _StatPill(
                value: '6',
                label: 'Categories',
                color: AppTheme.accent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatPill({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(18),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withAlpha(50), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color.withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }
}
