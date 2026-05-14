import 'package:flutter/rendering.dart';

import '../../core/app_export.dart';
import './widgets/category_chips_widget.dart';
import './widgets/hero_headline_widget.dart';
import './widgets/home_app_bar_widget.dart';
import './widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // TODO: Replace with Riverpod/Bloc for production
  int _currentNavIndex = 0;
  String _selectedCategory = 'All';
  bool _isLoading = true;
  bool _isNavVisible = true;
  final ScrollController _scrollController = ScrollController();
  late AnimationController _navAnimController;

  static final List<Map<String, dynamic>> _allProductMaps = [
    {
      'id': 'p001',
      'productName': 'Bidriware Flower Vase',
      'description':
          'Handcrafted zinc alloy vase with intricate silver inlay work, a 14th-century Bidar craft tradition. Each piece takes 3 days to complete.',
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
      'isFeatured': true,
      'variants': ['Small', 'Medium', 'Large'],
      'colors': ['#4A3728', '#6B5040', '#8B6A50'],
    },
    {
      'id': 'p002',
      'productName': 'Channapatna Wooden Toy Set',
      'description':
          'Eco-friendly lacquered wooden toys made from ivory wood. GI-tagged craft from Channapatna, Karnataka. Safe for children 3+.',
      'category': 'Handicrafts',
      'price': 680.0,
      'imageUrl':
          'https://images.unsplash.com/photo-1717913490995-e2451b78a9bb',
      'semanticLabel':
          'Colorful hand-painted wooden toy animals in red, yellow, and blue lacquer finish',
      'sellerName': 'Meenakshi Toys',
      'villageName': 'Channapatna',
      'rating': 4.9,
      'reviewCount': 87,
      'isWishlisted': true,
      'isFeatured': false,
      'variants': ['6-piece', '12-piece', '24-piece'],
      'colors': ['#D4283C', '#F5A623', '#2E7D32'],
    },
    {
      'id': 'p003',
      'productName': 'Dharwad Khaki Hand-spun Saree',
      'description':
          'Pure khadi cotton saree hand-spun by women artisans of Dharwad cooperative. 6.5 meters, breathable, perfect for Karnataka summer.',
      'category': 'Clothing',
      'price': 2200.0,
      'imageUrl':
          'https://images.unsplash.com/photo-1698773751017-5cb2111f0e24',
      'semanticLabel':
          'Cream and rust-bordered handwoven cotton saree draped on a mannequin in natural light',
      'sellerName': 'Kavitha Weavers',
      'villageName': 'Dharwad',
      'rating': 4.7,
      'reviewCount': 52,
      'isWishlisted': false,
      'isFeatured': true,
      'variants': ['S', 'M', 'L', 'XL'],
      'colors': ['#F5E6C8', '#C8822A', '#4A7C59'],
    },
    {
      'id': 'p004',
      'productName': 'Terracotta Kulhad Set (6)',
      'description':
          'Traditional clay kulhads hand-thrown on a wheel. Unglazed natural finish adds earthy flavour to chai. Kiln-fired at 900°C.',
      'category': 'Pottery',
      'price': 320.0,
      'imageUrl':
          'https://images.unsplash.com/photo-1732815172518-da8a0d971626',
      'semanticLabel':
          'Set of six rustic terracotta clay cups arranged on a jute mat with dried flowers',
      'sellerName': 'Ramaiah Kumhar',
      'villageName': 'Molakalmuru',
      'rating': 4.6,
      'reviewCount': 143,
      'isWishlisted': false,
      'isFeatured': false,
      'variants': ['Set of 4', 'Set of 6', 'Set of 12'],
      'colors': ['#C17A3A', '#8B5E3C', '#6B4030'],
    },
    {
      'id': 'p005',
      'productName': 'Cold-Pressed Coconut Oil (500ml)',
      'description':
          'Single-press virgin coconut oil from Malnad region coconuts. No heat, no chemicals. Rich aroma, suitable for cooking and hair care.',
      'category': 'Organic Food',
      'price': 420.0,
      'imageUrl':
          'https://img.rocket.new/generatedImages/rocket_gen_img_154257613-1772368886880.png',
      'semanticLabel':
          'Clear glass bottle of golden coconut oil with fresh coconut halves on a wooden table',
      'sellerName': 'Lakshmi Naturals',
      'villageName': 'Sagara',
      'rating': 4.9,
      'reviewCount': 218,
      'isWishlisted': true,
      'isFeatured': true,
      'variants': ['250ml', '500ml', '1 Litre'],
      'colors': ['#F5D878', '#D4A820', '#A88010'],
    },
    {
      'id': 'p006',
      'productName': 'Mysore Ganjifa Playing Cards',
      'description':
          'Hand-painted circular playing cards using natural mineral pigments. A rare 400-year-old art form from Mysore palace tradition.',
      'category': 'Paintings',
      'price': 3400.0,
      'imageUrl':
          'https://img.rocket.new/generatedImages/rocket_gen_img_1e593d9f8-1765866904419.png',
      'semanticLabel':
          'Circular hand-painted playing cards with intricate mythological figures in rich mineral colors',
      'sellerName': 'Parvathi Arts',
      'villageName': 'Mysuru',
      'rating': 5.0,
      'reviewCount': 19,
      'isWishlisted': false,
      'isFeatured': true,
      'variants': ['32-card set', '48-card set'],
      'colors': ['#8B1A1A', '#1A4A8B', '#4A8B1A'],
    },
    {
      'id': 'p007',
      'productName': 'Bamboo Lamp Shade',
      'description':
          'Handwoven bamboo lampshade with geometric tribal patterns. Casts beautiful shadow art on walls. 12-inch diameter, E27 bulb compatible.',
      'category': 'Home Decor',
      'price': 890.0,
      'imageUrl':
          'https://images.unsplash.com/photo-1705368540328-8878a718eb60',
      'semanticLabel':
          'Woven bamboo lampshade with geometric patterns casting warm patterned shadows on a white wall',
      'sellerName': 'Adivasi Crafts Co.',
      'villageName': 'Sirsi',
      'rating': 4.5,
      'reviewCount': 61,
      'isWishlisted': false,
      'isFeatured': false,
      'variants': ['10 inch', '12 inch', '16 inch'],
      'colors': ['#8B7355', '#C4A882', '#6B5030'],
    },
    {
      'id': 'p008',
      'productName': 'Ilkal Kasuti Embroidered Dupatta',
      'description':
          'Traditional Ilkal weave dupatta with hand-embroidered Kasuti motifs — peacocks, palanquins, and temple towers. GI-tagged craft.',
      'category': 'Clothing',
      'price': 1650.0,
      'imageUrl':
          'https://images.unsplash.com/photo-1698906852010-4d0cd8976dd0',
      'semanticLabel':
          'Rich maroon and gold dupatta with intricate hand-embroidered traditional motifs on silk fabric',
      'sellerName': 'Savitri Weavers',
      'villageName': 'Ilkal',
      'rating': 4.8,
      'reviewCount': 44,
      'isWishlisted': true,
      'isFeatured': false,
      'variants': ['2.5m', '3m'],
      'colors': ['#8B1A2A', '#D4A820', '#1A4A8B'],
    },
  ];

  List<Map<String, dynamic>> _products = [];
  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _navAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
      value: 1.0,
    );
    _products = List.from(_allProductMaps);
    _filteredProducts = List.from(_products);

    _scrollController.addListener(_handleScroll);

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    });
  }

  void _handleScroll() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse && _isNavVisible) {
      setState(() => _isNavVisible = false);
      _navAnimController.reverse();
    } else if (direction == ScrollDirection.forward && !_isNavVisible) {
      setState(() => _isNavVisible = true);
      _navAnimController.forward();
    }
  }

  void _onCategoryChanged(String category) {
    // TODO: Replace with Riverpod/Bloc for production
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredProducts = List.from(_products);
      } else {
        _filteredProducts = _products
            .where(
              (p) =>
                  (p['category'] as String).toLowerCase() ==
                  category.toLowerCase(),
            )
            .toList();
      }
    });
  }

  void _toggleWishlist(String productId) {
    // TODO: Replace with Riverpod/Bloc for production
    setState(() {
      final idx = _products.indexWhere((p) => p['id'] == productId);
      if (idx != -1) {
        _products[idx] = Map.from(_products[idx])
          ..['isWishlisted'] = !(_products[idx]['isWishlisted'] as bool);
      }
      final fidx = _filteredProducts.indexWhere((p) => p['id'] == productId);
      if (fidx != -1) {
        _filteredProducts[fidx] = Map.from(_filteredProducts[fidx])
          ..['isWishlisted'] =
              !(_filteredProducts[fidx]['isWishlisted'] as bool);
      }
    });
  }

  void _navigateToDetail(Map<String, dynamic> product) {
    Navigator.pushNamed(
      context,
      AppRoutes.productDetailScreen,
      arguments: product,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _navAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: HomeAppBarWidget(
                onSearchTap: () {
                  Navigator.pushNamed(context, AppRoutes.homeScreen);
                },
              ),
            ),
            SliverToBoxAdapter(child: HeroHeadlineWidget()),
            SliverToBoxAdapter(
              child: CategoryChipsWidget(
                selectedCategory: _selectedCategory,
                onCategoryChanged: _onCategoryChanged,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            if (_isLoading)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const ProductCardSkeletonWidget(),
                  childCount: 4,
                ),
              )
            else if (_filteredProducts.isEmpty)
              SliverFillRemaining(
                child: EmptyStateWidget(
                  iconName: 'storefront',
                  title: 'No products in $_selectedCategory',
                  subtitle:
                      'Artisans from this category will list their handmade items soon. Check back tomorrow!',
                  ctaLabel: 'Browse All Products',
                  onCta: () => _onCategoryChanged('All'),
                ),
              )
            else if (isTablet)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.72,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = _filteredProducts[index];
                    return ProductCardWidget(
                      product: product,
                      onWishlistTap: () =>
                          _toggleWishlist(product['id'] as String),
                      onTap: () => _navigateToDetail(product),
                      animationIndex: index,
                    );
                  }, childCount: _filteredProducts.length),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = _filteredProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ProductCardWidget(
                        product: product,
                        onWishlistTap: () =>
                            _toggleWishlist(product['id'] as String),
                        onTap: () => _navigateToDetail(product),
                        animationIndex: index,
                      ),
                    );
                  }, childCount: _filteredProducts.length),
                ),
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _navAnimController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, (1 - _navAnimController.value) * 100),
            child: child,
          );
        },
        child: _buildFloatingPillNav(theme),
      ),
    );
  }

  Widget _buildFloatingPillNav(ThemeData theme) {
    final items = [
      {'icon': 'home', 'iconOff': 'home_outlined', 'label': 'Home'},
      {'icon': 'search', 'iconOff': 'search', 'label': 'Search'},
      {'icon': 'add_circle', 'iconOff': 'add_circle', 'label': 'Sell'},
      {'icon': 'person', 'iconOff': 'person_outline', 'label': 'Profile'},
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          color: AppTheme.onSurfaceLight,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withAlpha(40),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final isActive = _currentNavIndex == index;
            return GestureDetector(
              onTap: () => setState(() => _currentNavIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isActive ? AppTheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIconWidget(
                      iconName: isActive
                          ? items[index]['icon']!
                          : items[index]['iconOff']!,
                      color: isActive ? Colors.white : AppTheme.mutedLight,
                      size: 22,
                    ),
                    if (isActive) ...[
                      const SizedBox(width: 6),
                      Text(
                        items[index]['label']!,
                        style: GoogleFonts.dmSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
