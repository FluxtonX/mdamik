import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'payment_processing_view.dart';

class PaymentReviewView extends StatelessWidget {
  const PaymentReviewView({super.key});

  static const routeName = '/payment/review';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    final method = args['method'] as String? ?? 'My Fawry';
    final currency = args['currency'] as String? ?? 'United States Dollars';
    final currencyCode = args['currencyCode'] as String? ?? 'USD';
    final amount = args['amount'] as String? ?? '24000';
    final fullName = args['fullName'] as String? ?? 'abc';
    final phone = args['phone'] as String? ?? '+249 02358585775';
    final email = args['email'] as String? ?? 'abc@gmail.com';
    final address = args['address'] as String? ?? 'Abc';
    final notes = args['notes'] as String? ?? 'Abc';
    
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
                          l10n?.paymentReview ?? 'Payment Review',
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
                  children: [
                    Text(
                      l10n?.reviewPayment ?? 'Review Payment',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n?.pleaseVerifyAllDetails ?? 'Please verify all details before confirming',
                      style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12),
                    ),
                    const SizedBox(height: 24),
                    
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFFCE6D3), width: 1.5),
                      ),
                      child: Column(
                        children: [
                          Text('Total Amount', style: TextStyle(color: const Color(0xFFF28B22).withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('$currencyCode $amount', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 8),
                          Text(currency, style: TextStyle(color: const Color(0xFFF28B22).withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
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
                    const SizedBox(height: 32),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n?.customerDetails ?? 'Customer Details',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFF28B22)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _buildDetailItem(icon: Icons.person_outline, title: 'Full Name', value: fullName),
                    _buildDetailItem(icon: Icons.phone_outlined, title: 'Phone Number', value: phone),
                    if (email.isNotEmpty) _buildDetailItem(icon: Icons.email_outlined, title: 'Email', value: email),
                    _buildDetailItem(icon: Icons.location_on_outlined, title: 'Delivery Address', value: address),
                    if (notes.isNotEmpty) _buildDetailItem(icon: Icons.description_outlined, title: 'Notes', value: notes, isLast: true),
                    
                    const SizedBox(height: 32),
                    
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
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
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pushNamed(
                              PaymentProcessingView.routeName,
                              arguments: args,
                            ),
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
                                const Icon(Icons.check_circle_outline, size: 18),
                                const SizedBox(width: 8),
                                Text(l10n?.confirmPayment ?? 'Confirm Payment', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
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

  Widget _buildDetailItem({required IconData icon, required String title, required String value, bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFF28B22), size: 18),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: const Color(0xFFF28B22), fontSize: 11, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
