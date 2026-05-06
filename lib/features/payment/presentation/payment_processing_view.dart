import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'payment_successful_view.dart';

class PaymentProcessingView extends StatefulWidget {
  const PaymentProcessingView({super.key});

  static const routeName = '/payment/processing';

  @override
  State<PaymentProcessingView> createState() => _PaymentProcessingViewState();
}

class _PaymentProcessingViewState extends State<PaymentProcessingView> {
  bool _hasNavigated = false;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    final method = args['method'] as String? ?? 'My Fawry';
    final currencyCode = args['currencyCode'] as String? ?? 'USD';
    final amount = args['amount'] as String? ?? '24000';

    // Simulate payment processing delay on first build
    if (!_hasNavigated) {
      _hasNavigated = true;
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(
            PaymentSuccessfulView.routeName,
            arguments: args,
          );
        }
      });
    }
    
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFFCE6D3), width: 1.5),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, color: Color(0xFFF28B22), size: 18),
                      padding: const EdgeInsets.all(8),
                      constraints: const BoxConstraints(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n?.paymentProcessing ?? 'Payment Processing',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          l10n?.choosePreferredPaymentMethod ?? 'Choose your preferred payment method',
                          style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Main Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFCE6D3), width: 1.5),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF28B22)),
                        strokeWidth: 4,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      l10n?.processingPayment ?? 'Processing Payment',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n?.pleaseWaitWhileWeProcess ?? 'Please wait while we process your payment...',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFFF28B22), fontSize: 14),
                    ),
                    const SizedBox(height: 40),
                    
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                l10n?.methodLabel ?? (l10n?.method ?? 'Method:'),
                                style: const TextStyle(
                                    color: Color(0xFFF28B22),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              Text(method, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(color: Color(0xFFFCE6D3)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                l10n?.amountLabel ?? (l10n?.amount ?? 'Amount:'),
                                style: const TextStyle(
                                    color: Color(0xFFF28B22),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: currencyCode),
                                    const TextSpan(text: ' '),
                                    TextSpan(text: amount),
                                  ],
                                ),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    
                    Text(
                      l10n?.paymentBeingSecurelyProcessed ?? 'Your payment is being securely processed. Do not close this window.',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFFF28B22), fontSize: 11, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
