import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentSuccessfulView extends StatelessWidget {
  const PaymentSuccessfulView({super.key});

  static const routeName = '/payment/successful';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
    final method = args['method'] as String? ?? 'My Fawry';
    final currencyCode = args['currencyCode'] as String? ?? 'USD';
    final amount = args['amount'] as String? ?? '24000';
    final fullName = args['fullName'] as String? ?? 'abc';
    final phone = args['phone'] as String? ?? '+249 02358585775';
    final address = args['address'] as String? ?? 'Abc';
    
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Main Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFFCE6D3), width: 1.5),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF00B16A), width: 2),
                      ),
                      child: const Icon(Icons.check, color: Color(0xFF00B16A), size: 40),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n?.paymentSuccessful ?? 'Payment Successful!',
                      style: const TextStyle(color: Color(0xFF00B16A), fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n?.paymentProcessedSuccessfully ?? 'Your payment has been processed successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 13),
                    ),
                    const SizedBox(height: 32),
                    
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF6ED),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFCE6D3), width: 1.5),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(l10n?.transactionId ?? 'Transaction ID', 'TXN69181880'),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(color: Color(0xFFFCE6D3)),
                          ),
                          _buildDetailRow(l10n?.dateAndTime ?? 'Date & Time', 'May 5, 2026 at 01:19 PM'),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(color: Color(0xFFFCE6D3)),
                          ),
                          _buildDetailRow(l10n?.amountPaid ?? 'Amount Paid', '$currencyCode $amount', isBoldValue: true),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(color: Color(0xFFFCE6D3)),
                          ),
                          _buildDetailRow(l10n?.paymentMethod ?? 'Payment Method', method),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n?.customerInformation ?? 'Customer Information',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFF28B22)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _buildCustomerInfoRow(Icons.person_outline, fullName),
                    const SizedBox(height: 12),
                    _buildCustomerInfoRow(Icons.phone_outlined, phone),
                    const SizedBox(height: 12),
                    _buildCustomerInfoRow(Icons.location_on_outlined, address),
                    
                    const SizedBox(height: 32),
                    
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F7F0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        l10n?.confirmationMessageSent ?? 'A confirmation message has been sent to your phone. Thank you for your payment!',
                        style: const TextStyle(color: Color(0xFF00B16A), fontSize: 12, fontWeight: FontWeight.w500, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 32),
                    
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFF28B22),
                        side: const BorderSide(color: Color(0xFFF28B22)),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.download_outlined, size: 18),
                          const SizedBox(width: 8),
                          Text(l10n?.downloadReceipt ?? 'Download Receipt', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF28B22),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home_outlined, size: 18),
                          const SizedBox(width: 8),
                          Text(l10n?.makeAnotherPayment ?? 'Make Another Payment', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
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

  Widget _buildDetailRow(String label, String value, {bool isBoldValue = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFFF28B22), fontSize: 12, fontWeight: FontWeight.w500)),
        Text(value, style: TextStyle(fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w600, fontSize: 13, color: Colors.black)),
      ],
    );
  }

  Widget _buildCustomerInfoRow(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFF28B22), size: 16),
        const SizedBox(width: 12),
        Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
