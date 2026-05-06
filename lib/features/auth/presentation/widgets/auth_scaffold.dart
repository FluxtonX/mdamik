import 'package:flutter/material.dart';

import 'auth_theme.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    this.headerTitle,
    required this.child,
    this.showBack = false,
    this.backgroundImageAsset,
  });

  final String title;
  final String? headerTitle;
  final Widget child;
  final bool showBack;

  /// When set, the image is shown full-bleed behind the scroll area (e.g. login).
  final String? backgroundImageAsset;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image at the bottom
          if (backgroundImageAsset != null)
            Positioned.fill(
              child: Image.asset(
                backgroundImageAsset!,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
          
          Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: top + 10, left: 24, right: 24, bottom: 40),
                decoration: const BoxDecoration(
                  gradient: AuthTheme.headerGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (showBack)
                          InkWell(
                            onTap: () => Navigator.of(context).maybePop(),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            'assets/images/medamak_logo_fixed.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                              ),
                        ),
                      ],
                    ),
                    if (headerTitle != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        headerTitle!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: Transform.translate(
                  offset: const Offset(0, -30),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: child,
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

