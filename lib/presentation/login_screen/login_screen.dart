import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_theme.dart' as app_theme;
import './widgets/demo_credentials_widget.dart';
import './widgets/login_form_widget.dart';
import './widgets/login_header_widget.dart';
import './widgets/role_selector_widget.dart';
import 'widgets/demo_credentials_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/login_header_widget.dart';
import 'widgets/role_selector_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  // TODO: Replace with Riverpod/Bloc for production
  String _selectedRole = 'buyer';
  bool _isLoading = false;
  late AnimationController _bgController;
  late Animation<double> _bgAnimation;

  @override
  void initState() {
    super.initState();
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
    _bgAnimation = CurvedAnimation(
      parent: _bgController,
      curve: Curves.easeInOutSine,
    );
  }

  @override
  void dispose() {
    _bgController.dispose();
    super.dispose();
  }

  void _onRoleChanged(String role) {
    setState(() => _selectedRole = role);
  }

  void _onLogin(String email, String password) async {
    setState(() => _isLoading = true);
    // TODO: Replace with real authentication (Firebase Auth / Supabase)
    await Future.delayed(const Duration(milliseconds: 1200));
    if (mounted) {
      setState(() => _isLoading = false);
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.homeScreen,
        (route) => false,
        arguments: {'role': _selectedRole},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTablet = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: app_theme.AppTheme.backgroundLight,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bgAnimation,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.lerp(
                      const Color(0xFFFAF6F0),
                      const Color(0xFFF5EFE6),
                      _bgAnimation.value,
                    )!,
                    Color.lerp(
                      const Color(0xFFF5EFE6),
                      const Color(0xFFFAF6F0),
                      _bgAnimation.value,
                    )!,
                  ],
                ),
              ),
              child: child,
            );
          },
          child: isTablet ? _buildTabletLayout() : _buildPhoneLayout(),
        ),
      ),
    );
  }

  Widget _buildPhoneLayout() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 48),
            const LoginHeaderWidget(),
            const SizedBox(height: 32),
            RoleSelectorWidget(
              selectedRole: _selectedRole,
              onRoleChanged: _onRoleChanged,
            ),
            const SizedBox(height: 28),
            LoginFormWidget(
              selectedRole: _selectedRole,
              isLoading: _isLoading,
              onLogin: _onLogin,
            ),
            const SizedBox(height: 24),
            const DemoCredentialsWidget(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: SizedBox(
        width: 480,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LoginHeaderWidget(),
                const SizedBox(height: 32),
                RoleSelectorWidget(
                  selectedRole: _selectedRole,
                  onRoleChanged: _onRoleChanged,
                ),
                const SizedBox(height: 28),
                LoginFormWidget(
                  selectedRole: _selectedRole,
                  isLoading: _isLoading,
                  onLogin: _onLogin,
                ),
                const SizedBox(height: 24),
                const DemoCredentialsWidget(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}