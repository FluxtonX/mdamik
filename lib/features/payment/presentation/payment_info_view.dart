import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'payment_review_view.dart';

class PaymentInfoView extends StatefulWidget {
  const PaymentInfoView({super.key});

  static const routeName = '/payment/info';

  @override
  State<PaymentInfoView> createState() => _PaymentInfoViewState();
}

class _PaymentInfoViewState extends State<PaymentInfoView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    final method = args['method'] as String? ?? 'My Fawry';
    final currencyCode = args['currencyCode'] as String? ?? 'USD';
    final amount = args['amount'] as String? ?? '24000';
    
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
                          l10n?.paymentInfo ?? 'Payment Info',
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
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFCE6D3), width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n?.paymentMethod ?? 'Payment Method',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFF28B22)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.account_balance_wallet_outlined, color: Color(0xFFF28B22), size: 14),
                              const SizedBox(width: 4),
                              Text(
                                method,
                                style: const TextStyle(color: Color(0xFFF28B22), fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n?.amountToPay ?? 'Amount to pay',
                            style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Text(
                            '$currencyCode $amount',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    _buildInput(label: 'Full Name *', hint: 'Enter your full name', controller: _nameController),
                    const SizedBox(height: 16),
                    _buildInput(label: 'Phone Number *', hint: '+249 XXX XXX XXX', isPhone: true, controller: _phoneController),
                    const SizedBox(height: 16),
                    _buildInput(label: l10n?.emailOptional ?? 'Email (Optional)', hint: 'your.email@example.com', controller: _emailController),
                    const SizedBox(height: 16),
                    _buildInput(
                      label: l10n?.deliveryAddress ?? 'Delivery Address *',
                      hint: 'Enter your complete delivery address',
                      icon: Icons.location_on_outlined,
                      controller: _addressController,
                    ),
                    const SizedBox(height: 16),
                    _buildInput(
                      label: l10n?.additionalNotesOptional ?? 'Additional Notes (Optional)',
                      hint: 'Any special instructions...',
                      maxLines: 3,
                      controller: _notesController,
                    ),
                    const SizedBox(height: 32),
                    
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(color: Color(0xFFF1F1F4)),
                              minimumSize: const Size(0, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.arrow_back, size: 16),
                                const SizedBox(width: 8),
                                Text(l10n?.back ?? 'Back', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              final newArgs = Map<String, dynamic>.from(args);
                              newArgs['fullName'] = _nameController.text;
                              newArgs['phone'] = _phoneController.text;
                              newArgs['email'] = _emailController.text;
                              newArgs['address'] = _addressController.text;
                              newArgs['notes'] = _notesController.text;
                              
                              Navigator.of(context).pushNamed(
                                PaymentReviewView.routeName,
                                arguments: newArgs,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF28B22),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(0, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(l10n?.continueBtn ?? 'Continue', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPhone = false,
    IconData? icon,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: const Color(0xFFF28B22), size: 16),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFFF28B22),
                fontWeight: maxLines > 1 ? FontWeight.w500 : FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFF1F1F4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFF28B22)),
            ),
          ),
        ),
      ],
    );
  }
}
