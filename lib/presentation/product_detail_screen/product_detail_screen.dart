import '../../core/app_export.dart';
import './widgets/action_buttons_widget.dart';
import './widgets/artisan_info_widget.dart';
import './widgets/color_selector_widget.dart';
import './widgets/detail_app_bar_widget.dart';
import './widgets/product_hero_image_widget.dart';
import './widgets/size_selector_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic>? productData;

  const ProductDetailScreen({super.key, this.productData});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // TODO: Replace with Riverpod/Bloc for production
  String? _selectedVariant;
  String? _selectedColorHex;
  bool _isWishlisted = false;
  int _cartCount = 2;
  bool _isAddingToCart = false;

  late Map<String, dynamic> _product;

  static const Map<String, dynamic> _fallbackProduct = {
    'id': 'p001',
    'productName': 'Bidriware Flower Vase',
    'description':
        'Handcrafted zinc alloy vase with intricate silver inlay work, a 14th-century Bidar craft tradition. Each piece takes 3 days to complete by master artisans who have inherited this skill across generations.',
    'category': 'Handicrafts',
    'price': 1850.0,
    'imageUrl':
        'https://images.unsplash.com/photo-1669823446464-17d36384e126',
    'semanticLabel':
        'Ornate dark metal vase with silver floral inlay patterns on a wooden surface',
    'sellerName': 'Suresh Bidri',
    'villageName': 'Bidar',
    'rating': 4.8,
    'reviewCount': 34,
    'isWishlisted': false,
    'variants': ['Small', 'Medium', 'Large'],
    'colors': ['#4A3728', '#6B5040', '#8B6A50'],
  };

  @override
  void initState() {
    super.initState();
    _product = widget.productData ?? _fallbackProduct;
    _isWishlisted = _product['isWishlisted'] as bool? ?? false;
    final variants = _product['variants'] as List?;
    if (variants != null && variants.isNotEmpty) {
      _selectedVariant = variants[0] as String;
    }
    final colors = _product['colors'] as List?;
    if (colors != null && colors.isNotEmpty) {
      _selectedColorHex = colors[0] as String;
    }
  }

  void _onVariantSelected(String variant) {
    setState(() => _selectedVariant = variant);
  }

  void _onColorSelected(String hex) {
    setState(() => _selectedColorHex = hex);
  }

  void _toggleWishlist() {
    setState(() => _isWishlisted = !_isWishlisted);
  }

  void _addToCart() async {
    setState(() => _isAddingToCart = true);
    // TODO: Replace with real cart logic
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      setState(() {
        _isAddingToCart = false;
        _cartCount++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✓ Added to basket!',
            style: GoogleFonts.dmSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          backgroundColor: AppTheme.accent,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  void _buyNow() {
    // TODO: Replace with real checkout navigation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Proceeding to checkout…',
          style: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        backgroundColor: AppTheme.primary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      body: SafeArea(
        child: isTablet
            ? _buildTabletLayout(theme)
            : _buildPhoneLayout(theme),
      ),
    );
  }

  Widget _buildPhoneLayout(ThemeData theme) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero image (45% viewport)
              ProductHeroImageWidget(
                imageUrl: _product['imageUrl'] as String,
                semanticLabel: _product['semanticLabel'] as String,
                productId: _product['id'] as String,
                category: _product['category'] as String,
              ),
              _buildInfoPanel(theme),
              const SizedBox(height: 100),
            ],
          ),
        ),
        // Floating AppBar overlay
        DetailAppBarWidget(
          cartCount: _cartCount,
          onBack: () => Navigator.pop(context),
          onCart: () {},
        ),
      ],
    );
  }

  Widget _buildTabletLayout(ThemeData theme) {
    return Row(
      children: [
        // Left: image
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              ProductHeroImageWidget(
                imageUrl: _product['imageUrl'] as String,
                semanticLabel: _product['semanticLabel'] as String,
                productId: _product['id'] as String,
                category: _product['category'] as String,
                fillHeight: true,
              ),
              DetailAppBarWidget(
                cartCount: _cartCount,
                onBack: () => Navigator.pop(context),
                onCart: () {},
              ),
            ],
          ),
        ),
        // Right: info panel
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 40),
            child: _buildInfoPanel(theme),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoPanel(ThemeData theme) {
    final price = _product['price'] as double;
    final variants =
        (_product['variants'] as List?)?.cast<String>() ?? [];
    final colors =
        (_product['colors'] as List?)?.cast<String>() ?? [];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product name
          Text(
            _product['productName'] as String,
            style: GoogleFonts.dmSans(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppTheme.onSurfaceLight,
              height: 1.2,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          // Artisan info card
          ArtisanInfoWidget(
            sellerName: _product['sellerName'] as String,
            villageName: _product['villageName'] as String,
            rating: _product['rating'] as double,
            reviewCount: _product['reviewCount'] as int,
            isWishlisted: _isWishlisted,
            onWishlistTap: _toggleWishlist,
          ),
          const SizedBox(height: 20),
          // Variant / Size selector
          if (variants.isNotEmpty) ...[
            Text(
              'Variant',
              style: GoogleFonts.dmSans(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppTheme.onSurfaceLight,
              ),
            ),
            const SizedBox(height: 10),
            SizeSelectorWidget(
              variants: variants,
              selectedVariant: _selectedVariant,
              onVariantSelected: _onVariantSelected,
            ),
            const SizedBox(height: 20),
          ],
          // Color selector
          if (colors.isNotEmpty) ...[
            Text(
              'Colour',
              style: GoogleFonts.dmSans(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppTheme.onSurfaceLight,
              ),
            ),
            const SizedBox(height: 10),
            ColorSelectorWidget(
              colorHexList: colors,
              selectedHex: _selectedColorHex,
              onColorSelected: _onColorSelected,
            ),
            const SizedBox(height: 20),
          ],
          // Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹',
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(width: 2),
              Text(
                price.toStringAsFixed(0),
                style: GoogleFonts.dmSans(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primary,
                  fontFeatures: [const FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Free delivery • Handmade & certified',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              color: AppTheme.accent,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          // About section
          Text(
            'About',
            style: GoogleFonts.dmSans(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppTheme.onSurfaceLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _product['description'] as String,
            style: GoogleFonts.dmSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.mutedLight,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          // Action buttons
          ActionButtonsWidget(
            isAddingToCart: _isAddingToCart,
            onAddToCart: _addToCart,
            onBuyNow: _buyNow,
          ),
        ],
      ),
    );
  }
}