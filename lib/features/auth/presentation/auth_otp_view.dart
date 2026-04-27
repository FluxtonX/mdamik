import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/mvvm/view_model_builder.dart';
import 'auth_otp_view_model.dart';

class AuthOtpView extends StatelessWidget {
  const AuthOtpView({super.key});

  static const routeName = '/auth/otp';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthOtpViewModel>(
      viewModelBuilder: () => AuthOtpViewModel(),
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
                          const SizedBox(height: 14),
                          Text(
                            'Forgot your password?',
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
                  'assets/images/construction_login_bg.png',
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _CodeField(
                                    onChanged: vm.onCodeChanged,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                SizedBox(
                                  height: 50,
                                  width: 110,
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
                                      onPressed: vm.resend,
                                      child: const Text(
                                        'Resend',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Text(
                              'We texted you a code to verify your phone\nnumber (+966) 12 275 00XX',
                              style: TextStyle(
                                color: const Color(0xFFE57E2E).withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "This code will expired 10 minutes after this\nmessage. If you don't get a message.",
                              style: TextStyle(
                                color: const Color(0xFFE57E2E).withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: vm.canSubmit
                                      ? const Color(0xFFF28B22)
                                      : const Color(0xFFF7B37A),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      blurRadius: 18,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: vm.canSubmit
                                      ? () => Navigator.of(context)
                                          .pushNamed('/auth/reset-password')
                                      : null,
                                  child: Text(
                                    'Change Password',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(
                                        vm.canSubmit ? 1.0 : 0.85,
                                      ),
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
                      SizedBox(height: size.height * 0.26),
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

class _CodeField extends StatelessWidget {
  const _CodeField({required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F6),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          const Icon(Icons.lock_outline, color: Color(0xFFD9A58A)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(4),
              ],
              decoration: const InputDecoration(
                hintText: 'Code',
                hintStyle: TextStyle(color: Color(0xFFC7C7CD)),
                border: InputBorder.none,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

