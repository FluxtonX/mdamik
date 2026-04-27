import 'package:flutter/material.dart';

import 'auth_theme.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    required this.title,
    required this.child,
    this.showBack = false,
    this.backgroundImageAsset,
  });

  final String title;
  final Widget child;
  final bool showBack;

  /// When set, the image is shown full-bleed behind the scroll area (e.g. login).
  final String? backgroundImageAsset;

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 132 + top,
                width: double.infinity,
                padding: EdgeInsets.only(top: top + 10, left: 16, right: 16),
                decoration: const BoxDecoration(
                  gradient: AuthTheme.headerGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Row(
                  children: [
                    if (showBack)
                      InkWell(
                        onTap: () => Navigator.of(context).maybePop(),
                        borderRadius: BorderRadius.circular(10),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.white),
                        ),
                      )
                    else
                      const SizedBox(width: 40),
                    const SizedBox(width: 6),
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/images/mdamik_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: backgroundImageAsset == null
                    ? SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: child,
                      )
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            backgroundImageAsset!,
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter,
                          ),
                          // Soften top edge and keep form readable
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white.withOpacity(0.35),
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.15),
                                ],
                                stops: const [0.0, 0.35, 1.0],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: child,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

