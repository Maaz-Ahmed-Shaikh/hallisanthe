import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';

/// Anatomy locked: horizontal Row, circle swatches ~24px diameter,
/// selected = outer ring border, label beside selected
class ColorSelectorWidget extends StatelessWidget {
  final List<String> colorHexList;
  final String? selectedHex;
  final ValueChanged<String> onColorSelected;

  const ColorSelectorWidget({
    super.key,
    required this.colorHexList,
    required this.selectedHex,
    required this.onColorSelected,
  });

  Color _hexToColor(String hex) {
    try {
      final cleaned = hex.replaceAll('#', '');
      return Color(int.parse('FF$cleaned', radix: 16));
    } catch (_) {
      return AppTheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: colorHexList.map((hex) {
          final isSelected = selectedHex == hex;
          final color = _hexToColor(hex);

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onColorSelected(hex),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: isSelected
                          ? Border.all(
                              color: AppTheme.onSurfaceLight,
                              width: 2.5,
                            )
                          : Border.all(color: AppTheme.outlineLight, width: 1),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: color.withAlpha(80),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : [],
                    ),
                  ),
                  if (isSelected) ...[
                    const SizedBox(width: 6),
                    Text(
                      hex.toUpperCase(),
                      style: GoogleFonts.dmSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.mutedLight,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
