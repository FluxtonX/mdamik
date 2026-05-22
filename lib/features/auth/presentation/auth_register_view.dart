import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/mvvm/view_model_builder.dart';
import 'auth_register_view_model.dart';

class AuthRegisterView extends StatelessWidget {
  const AuthRegisterView({super.key});

  static const routeName = '/auth/register';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthRegisterViewModel>(
      viewModelBuilder: () => AuthRegisterViewModel(),
      builder: (context, vm, _) {
        final top = MediaQuery.paddingOf(context).top;
        final size = MediaQuery.sizeOf(context);
        final l10n = AppLocalizations.of(context);

        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Container(
                      height: 230 + top,
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        top: top + 14,
                        left: 20,
                        right: 20,
                        bottom: 18,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE57E2E),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  'assets/images/medamak_logo_fixed.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'مداميك',
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n?.createAccountDesc ?? 'Create your account to get started.',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.white.withOpacity(0.92),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: size.height * 0.38,
                child: Image.asset(
                  'assets/images/construction_signup_bg.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 18,
                    right: 18,
                    top: 170 + top,
                    bottom: 28,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              blurRadius: 30,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            _SegmentedTabs(
                              isLogin: vm.isLogin,
                              onLogin: () {
                                vm.selectLogin();
                                Navigator.of(context)
                                    .pushReplacementNamed('/auth/login');
                              },
                              onSignUp: vm.selectSignUp,
                              l10n: l10n,
                            ),
                            const SizedBox(height: 22),
                            _AuthInput(
                              controller: vm.fullNameController,
                              hint: l10n?.fullName ?? 'Full Name',
                              icon: Icons.person_outline,
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 12),
                            _AuthInput(
                              controller: vm.emailController,
                              hint: l10n?.emailAddress ?? 'Email address',
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 12),
                            _AuthInput(
                              controller: vm.passwordController,
                              hint: l10n?.password ?? 'Password',
                              icon: Icons.lock_outline,
                              obscureText: true,
                              showEye: true,
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF28B22),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFF28B22)
                                          .withOpacity(0.35),
                                      blurRadius: 18,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: vm.isLoading
                                      ? null
                                      : () async {
                                          final error = await vm.signUp();
                                          if (!context.mounted) return;
                                          if (error != null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(error),
                                                backgroundColor: Colors.redAccent,
                                              ),
                                            );
                                          } else {
                                            Navigator.of(context).pushReplacementNamed('/home/main');
                                          }
                                        },
                                  child: vm.isLoading
                                      ? const SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2.5,
                                          ),
                                        )
                                      : Text(
                                          l10n?.createAccount ?? 'Create Account',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.22),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SegmentedTabs extends StatelessWidget {
  const _SegmentedTabs({
    required this.isLogin,
    required this.onLogin,
    required this.onSignUp,
    this.l10n,
  });

  final bool isLogin;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;
  final AppLocalizations? l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F4),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabPill(
              label: l10n?.loginTab ?? 'Login',
              active: isLogin,
              onTap: onLogin,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _TabPill(
              label: l10n?.signUpTab ?? 'Sign Up',
              active: !isLogin,
              onTap: onSignUp,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabPill extends StatelessWidget {
  const _TabPill({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFF28B22) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: active
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                )
              ]
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.black38,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthInput extends StatefulWidget {
  const _AuthInput({
    required this.hint,
    required this.icon,
    this.keyboardType,
    this.obscureText = false,
    this.showEye = false,
    this.controller,
  });

  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool showEye;
  final TextEditingController? controller;

  @override
  State<_AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<_AuthInput> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F6),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Icon(widget.icon, color: const Color(0xFFD9A58A)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: _obscure,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Color(0xFFC7C7CD)),
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.showEye)
            IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(
                _obscure ? Icons.visibility_off_outlined : Icons.visibility,
                color: Colors.black38,
              ),
            ),
        ],
      ),
    );
  }
}

