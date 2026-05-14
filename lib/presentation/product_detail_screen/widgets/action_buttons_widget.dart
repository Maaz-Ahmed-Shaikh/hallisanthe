import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';

/// Anatomy locked: Row, 2 equal-width buttons full row width,
/// "Add to Basket" outlined left + "Buy Now" filled dark right,
/// both pill-shaped
class ActionButtonsWidget extends StatelessWidget {
  final bool isAddingToCart;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const ActionButtonsWidget({
    super.key,
    required this.isAddingToCart,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Add to Basket — outlined left
        Expanded(
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppTheme.primary, width: 2),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(999),
              child: InkWell(
                onTap: isAddingToCart ? null : onAddToCart,
                borderRadius: BorderRadius.circular(999),
                splashColor: AppTheme.primary.withAlpha(20),
                child: Center(
                  child: isAddingToCart
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppTheme.primary,
                          ),
                        )
                      : Text(
                          'Add to Basket',
                          style: GoogleFonts.dmSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primary,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Buy Now — filled dark right
        Expanded(
          child: Container(
            height: 54,
            decoration: BoxDecoration(
              color: AppTheme.onSurfaceLight,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.onSurfaceLight.withAlpha(40),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(999),
              child: InkWell(
                onTap: onBuyNow,
                borderRadius: BorderRadius.circular(999),
                splashColor: Colors.white.withAlpha(30),
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
