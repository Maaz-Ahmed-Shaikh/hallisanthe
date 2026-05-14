import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/custom_image_widget.dart';

class ArtisanInfoWidget extends StatelessWidget {
  final String sellerName;
  final String villageName;
  final double rating;
  final int reviewCount;
  final bool isWishlisted;
  final VoidCallback onWishlistTap;

  const ArtisanInfoWidget({
    super.key,
    required this.sellerName,
    required this.villageName,
    required this.rating,
    required this.reviewCount,
    required this.isWishlisted,
    required this.onWishlistTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceVariantLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.outlineVariantLight, width: 1),
      ),
      child: Row(
        children: [
          // Artisan avatar
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.primary.withAlpha(60),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: CustomImageWidget(
                imageUrl:
                    'https://images.pexels.com/photos/8942991/pexels-photo-8942991.jpeg',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                semanticLabel:
                    'Artisan portrait of an Indian craftsman in traditional attire',
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Artisan info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerName,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.onSurfaceLight,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    CustomIconWidget(
                      iconName: 'location_on',
                      color: AppTheme.primary,
                      size: 13,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      villageName,
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: AppTheme.mutedLight,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.star_rounded,
                      size: 13,
                      color: AppTheme.secondary,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '$rating ($reviewCount)',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.onSurfaceLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Wishlist heart
          GestureDetector(
            onTap: onWishlistTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: isWishlisted ? Colors.red.withAlpha(20) : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isWishlisted
                      ? Colors.red.withAlpha(80)
                      : AppTheme.outlineLight,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: CustomIconWidget(
                  iconName: isWishlisted ? 'favorite' : 'favorite_border',
                  color: isWishlisted ? Colors.red : AppTheme.mutedLight,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
