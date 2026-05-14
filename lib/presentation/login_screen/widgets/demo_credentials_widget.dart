import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_theme.dart';

class DemoCredentialsWidget extends StatelessWidget {
  const DemoCredentialsWidget({super.key});

  static const List<Map<String, String>> _credentials = [
    {
      'role': 'Buyer',
      'email': 'priya.nair@hallibuyer.in',
      'password': 'halli@2026',
    },
    {
      'role': 'Artisan',
      'email': 'raju.kumhar@hallicraft.in',
      'password': 'craft@2026',
    },
  ];

  void _copy(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$label copied!',
          style: GoogleFonts.dmSans(fontSize: 13, color: Colors.white),
        ),
        backgroundColor: AppTheme.primary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryContainer.withAlpha(180),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withAlpha(40), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_rounded, size: 16, color: AppTheme.primary),
              const SizedBox(width: 6),
              Text(
                'Demo Accounts',
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ..._credentials.map(
            (cred) => _CredentialRow(
              credential: cred,
              onCopy: (text, label) => _copy(context, text, label),
            ),
          ),
        ],
      ),
    );
  }
}

class _CredentialRow extends StatelessWidget {
  final Map<String, String> credential;
  final Function(String text, String label) onCopy;

  const _CredentialRow({required this.credential, required this.onCopy});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(160),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                credential['role']!,
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            _CredentialField(
              label: 'Email',
              value: credential['email']!,
              onCopy: () => onCopy(credential['email']!, 'Email'),
            ),
            const SizedBox(height: 4),
            _CredentialField(
              label: 'Password',
              value: credential['password']!,
              onCopy: () => onCopy(credential['password']!, 'Password'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CredentialField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onCopy;

  const _CredentialField({
    required this.label,
    required this.value,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 64,
          child: Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppTheme.mutedLight,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.onSurfaceLight,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GestureDetector(
          onTap: onCopy,
          child: Icon(Icons.copy_rounded, size: 16, color: AppTheme.primary),
        ),
      ],
    );
  }
}

extension _AppThemeExt on AppTheme {
  static Color get primary => const Color(0xFF8B5E3C);
  static Color get mutedLight => const Color(0xFFA89880);
  static Color get primaryContainer => const Color(0xFFF0E0CF);
  static Color get onSurfaceLight => const Color(0xFF2C1A0E);
}

// Access via AppTheme class directly
