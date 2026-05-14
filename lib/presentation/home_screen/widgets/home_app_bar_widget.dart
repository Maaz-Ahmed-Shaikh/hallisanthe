import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/custom_icon_widget.dart';
import '../../../widgets/custom_image_widget.dart';

class HomeAppBarWidget extends StatelessWidget {
  final VoidCallback onSearchTap;

  const HomeAppBarWidget({super.key, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 42,
            height: 42,
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
                    'https://images.pexels.com/photos/3586798/pexels-photo-3586798.jpeg',
                width: 42,
                height: 42,
                fit: BoxFit.cover,
                semanticLabel:
                    'Profile photo of a young Indian woman with dark hair smiling',
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Title block
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HalliSanthe',
                  style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primary,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'ಹಳ್ಳಿ ಸಂತೆ • Village Market',
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppTheme.mutedLight,
                  ),
                ),
              ],
            ),
          ),
          // Notification bell
          Container(
            width: 42,
            height: 42,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),
                splashColor: AppTheme.primary.withAlpha(30),
                child: Center(
                  child: Badge(
                    backgroundColor: AppTheme.secondary,
                    smallSize: 8,
                    child: CustomIconWidget(
                      iconName: 'notifications_none',
                      color: AppTheme.onSurfaceLight,
                      size: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Search button
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppTheme.onSurfaceLight,
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onSearchTap,
                customBorder: const CircleBorder(),
                splashColor: Colors.white.withAlpha(40),
                child: Center(
                  child: CustomIconWidget(
                    iconName: 'search',
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
