import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';

/// Anatomy locked: horizontal Row, rectangular chips (NOT pill),
/// 8px border radius, selected = dark filled, unselected = outlined
class SizeSelectorWidget extends StatelessWidget {
  final List<String> variants;
  final String? selectedVariant;
  final ValueChanged<String> onVariantSelected;

  const SizeSelectorWidget({
    super.key,
    required this.variants,
    required this.selectedVariant,
    required this.onVariantSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: variants.map((variant) {
          final isSelected = selectedVariant == variant;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutCubic,
              decoration: BoxDecoration(
                // LOCKED: rectangular chip, 8px radius — NOT pill
                color: isSelected
                    ? AppTheme.onSurfaceLight
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? AppTheme.onSurfaceLight
                      : AppTheme.outlineLight,
                  width: 1.5,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => onVariantSelected(variant),
                  borderRadius: BorderRadius.circular(8),
                  splashColor: AppTheme.primary.withAlpha(30),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    child: Text(
                      variant,
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : AppTheme.onSurfaceLight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
