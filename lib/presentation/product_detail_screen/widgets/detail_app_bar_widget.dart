import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/custom_icon_widget.dart';

class DetailAppBarWidget extends StatelessWidget {
  final int cartCount;
  final VoidCallback onBack;
  final VoidCallback onCart;

  const DetailAppBarWidget({
    super.key,
    required this.cartCount,
    required this.onBack,
    required this.onCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back circle button — anatomy locked
          _CircleButton(
            iconName: 'arrow_back',
            onTap: onBack,
            backgroundColor: Colors.white,
            iconColor: AppTheme.onSurfaceLight,
          ),
          // Cart circle button with badge — anatomy locked
          Stack(
            clipBehavior: Clip.none,
            children: [
              _CircleButton(
                iconName: 'shopping_basket',
                onTap: onCart,
                backgroundColor: AppTheme.onSurfaceLight,
                iconColor: Colors.white,
              ),
              if (cartCount > 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: AppTheme.secondary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        '$cartCount',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final String iconName;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;

  const _CircleButton({
    required this.iconName,
    required this.onTap,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(18),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          splashColor: AppTheme.primary.withAlpha(30),
          child: Center(
            child: CustomIconWidget(
              iconName: iconName,
              color: iconColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
