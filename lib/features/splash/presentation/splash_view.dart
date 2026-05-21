import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/mvvm/view_model_builder.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (vm) async {
        await vm.init();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          vm.startCountdown(
            duration: const Duration(seconds: 3),
            onDone: () {
              if (!context.mounted) return;
              if (vm.isUserLoggedIn) {
                Navigator.of(context).pushReplacementNamed('/home/main');
              } else {
                Navigator.of(context).pushReplacementNamed('/language/choose');
              }
            },
          );
        });
      },
      builder: (context, vm, _) {
        final size = MediaQuery.sizeOf(context);

        return Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE57E2E), // warm orange
                  Color(0xFFF0B58F), // peach
                  Color(0xFFF3E8D9), // warm off-white
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  const _BrandBlock(),
                  const Spacer(flex: 2),
                  const _WelcomeBlock(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: SizedBox(
                      width: 34,
                      height: 34,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BrandBlock extends StatelessWidget {
  const _BrandBlock();

  @override
  Widget build(BuildContext context) {
    const brandOrange = Color(0xFFE57E2E);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.18),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(14),
          child: Image.asset(
            'assets/images/medamak_logo_fixed.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'مداميك',
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: brandOrange,
                fontWeight: FontWeight.w700,
                height: 1.0,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          'MDAMIK',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: brandOrange,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
        ),
      ],
    );
  }
}

class _WelcomeBlock extends StatelessWidget {
  const _WelcomeBlock();

  @override
  Widget build(BuildContext context) {
    final onBg = Colors.white.withOpacity(0.92);
    final onBgSoft = Colors.white.withOpacity(0.75);
    final l10n = AppLocalizations.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n?.welcomeTo ?? 'Welcome to',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: onBg,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          l10n?.appName ?? 'مداميك',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: onBg,
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n?.buildYourFuture ?? 'Build Your Future',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: onBgSoft,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
