import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/custom_image_widget.dart';
import '../../../widgets/status_badge_widget.dart';

class ProductHeroImageWidget extends StatelessWidget {
  final String imageUrl;
  final String semanticLabel;
  final String productId;
  final String category;
  final bool fillHeight;

  const ProductHeroImageWidget({
    super.key,
    required this.imageUrl,
    required this.semanticLabel,
    required this.productId,
    required this.category,
    this.fillHeight = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = fillHeight ? double.infinity : screenHeight * 0.42;

    return Container(
      width: double.infinity,
      height: fillHeight ? double.infinity : imageHeight,
      decoration: BoxDecoration(
        color: AppTheme.surfaceVariantLight,
        borderRadius: fillHeight
            ? BorderRadius.zero
            : const BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
      ),
      child: Stack(
        children: [
          // Product image — Hero transition from list card
          ClipRRect(
            borderRadius: fillHeight
                ? BorderRadius.zero
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
            child: Hero(
              tag: 'product-image-$productId',
              child: CustomImageWidget(
                imageUrl: imageUrl,
                width: double.infinity,
                height: fillHeight ? double.infinity : imageHeight,
                fit: BoxFit.cover,
                semanticLabel: semanticLabel,
              ),
            ),
          ),
          // Subtle gradient at bottom for readability
          if (!fillHeight)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppTheme.surfaceVariantLight.withAlpha(180),
                    ],
                  ),
                ),
              ),
            ),
          // Handmade badge bottom-left
          Positioned(
            bottom: fillHeight ? 20 : 16,
            left: 16,
            child: StatusBadgeWidget.handmade(context),
          ),
          // Category badge bottom-right
          Positioned(
            bottom: fillHeight ? 20 : 16,
            right: 16,
            child: StatusBadgeWidget.category(context, category),
          ),
        ],
      ),
    );
  }
}
