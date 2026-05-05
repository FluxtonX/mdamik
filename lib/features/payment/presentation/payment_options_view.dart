import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'payment_info_view.dart';

class PaymentOptionsView extends StatefulWidget {
  const PaymentOptionsView({super.key});

  static const routeName = '/payment/options';

  @override
  State<PaymentOptionsView> createState() => _PaymentOptionsViewState();
}

class _PaymentOptionsViewState extends State<PaymentOptionsView> {
  String _selectedMethod = 'Bangkok Bank';
  String _selectedCurrency = 'Sudanese Pound';
  final TextEditingController _amountController = TextEditingController(text: '24000');

  String _getCurrencyCode(String currency) {
    if (currency == 'Sudanese Pound') return 'SDG';
    if (currency == 'Saudi Riyal') return 'SAR';
    return 'USD';
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
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
                          l10n?.paymentOptions ?? 'Payment Options',
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
                    Text(
                      l10n?.paymentMethod ?? 'Payment Method',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    _buildOptionItem(
                      icon: Icons.account_balance_wallet_outlined,
                      title: l10n?.myFawry ?? 'MyFawry',
                      subtitle: l10n?.payWithMyFawryApp ?? 'Pay with MyFawry app',
                      value: 'MyFawry',
                      groupValue: _selectedMethod,
                      onChanged: (v) => setState(() => _selectedMethod = v!),
                    ),
                    _buildOptionItem(
                      icon: Icons.payments_outlined,
                      title: l10n?.cash ?? 'Cash',
                      subtitle: l10n?.payWithCashOnDelivery ?? 'Pay with cash on delivery',
                      value: 'Cash',
                      groupValue: _selectedMethod,
                      onChanged: (v) => setState(() => _selectedMethod = v!),
                    ),
                    _buildOptionItem(
                      icon: Icons.account_balance_outlined,
                      title: l10n?.bangkokBank ?? 'Bangkok Bank',
                      subtitle: l10n?.payWithBangkokBankApp ?? 'Pay with Bangkok Bank app',
                      value: 'Bangkok Bank',
                      groupValue: _selectedMethod,
                      onChanged: (v) => setState(() => _selectedMethod = v!),
                    ),
                    const SizedBox(height: 24),
                    
                    Text(
                      l10n?.currency ?? 'Currency',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    _buildCurrencyItem(
                      title: l10n?.sudanesePound ?? 'Sudanese Pound',
                      subtitle: 'جنيه سوداني',
                      value: 'Sudanese Pound',
                      groupValue: _selectedCurrency,
                      onChanged: (v) => setState(() => _selectedCurrency = v!),
                    ),
                    _buildCurrencyItem(
                      title: l10n?.usDollar ?? 'US Dollar',
                      subtitle: 'دولار',
                      value: 'US Dollar',
                      groupValue: _selectedCurrency,
                      onChanged: (v) => setState(() => _selectedCurrency = v!),
                    ),
                    _buildCurrencyItem(
                      title: l10n?.saudiRiyal ?? 'Saudi Riyal',
                      subtitle: 'ريال',
                      value: 'Saudi Riyal',
                      groupValue: _selectedCurrency,
                      onChanged: (v) => setState(() => _selectedCurrency = v!),
                    ),
                    const SizedBox(height: 24),
                    
                    Text(
                      '${l10n?.amount ?? 'Amount'} (${_getCurrencyCode(_selectedCurrency)})',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter amount',
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
                    const SizedBox(height: 32),
                    
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          PaymentInfoView.routeName,
                          arguments: {
                            'method': _selectedMethod,
                            'currency': _selectedCurrency,
                            'currencyCode': _getCurrencyCode(_selectedCurrency),
                            'amount': _amountController.text.isEmpty ? '0' : _amountController.text,
                          },
                        );
                      },
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
                          Text(l10n?.proceedToPayment ?? 'Proceed to Payment', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 18),
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

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF6ED) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: const Color(0xFFF28B22),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: const Color(0xFFF28B22), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(subtitle, style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyItem({
    required String title,
    required String subtitle,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF6ED) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: const Color(0xFFF28B22),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Expanded(
              child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
            Text(subtitle, style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
