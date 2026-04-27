import 'package:flutter/material.dart';

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
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
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
                                  'assets/images/mdamik_logo.png',
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
                            'Create your account to get started.',
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
                            ),
                            const SizedBox(height: 18),
                            const _AuthInput(
                              hint: 'Full Name',
                              icon: Icons.person_outline,
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 12),
                            const _AuthInput(
                              hint: 'Email address',
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 12),
                            const _AuthInput(
                              hint: 'Phone number',
                              icon: Icons.phone_outlined,
                              keyboardType: TextInputType.phone,
                            ),
                            const SizedBox(height: 12),
                            const _AuthInput(
                              hint: 'Password',
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
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed('/auth/success'),
                                  child: const Text(
                                    'Create Account',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'or continue with',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed('/auth/success'),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google_icon.png',
                                      height: 18,
                                      width: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
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
  });

  final bool isLogin;
  final VoidCallback onLogin;
  final VoidCallback onSignUp;

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
              label: 'Login',
              active: isLogin,
              onTap: onLogin,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _TabPill(
              label: 'Sign Up',
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
  });

  final String hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool showEye;

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

