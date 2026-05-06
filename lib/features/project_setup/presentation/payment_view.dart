import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'payment_success_view.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(l10n.paymentMethod, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.orderSummary, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 24),
                  _SummaryItem(label: l10n.houseConstruction200, value: l10n.cost12500),
                  const SizedBox(height: 16),
                  _SummaryItem(label: l10n.engineeringServices, value: l10n.cost4800),
                  const SizedBox(height: 16),
                  _SummaryItem(label: l10n.labor15x30, value: l10n.cost8200),
                  const SizedBox(height: 16),
                  _SummaryItem(label: l10n.finishingMaterials, value: l10n.cost3500),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(color: Color(0xFFF1F1F4)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.totalLabel, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(l10n.cost29000, style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.w900, fontSize: 24)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Payment Method Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.paymentMethod, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE6D3).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFF28B22), width: 1.5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCE6D3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.credit_card, color: Color(0xFFF28B22), size: 20),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.maskedCard4242, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            Text(l10n.visaExpires1228, style: const TextStyle(color: Colors.black26, fontSize: 11, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shield_outlined, color: Colors.green, size: 16),
                const SizedBox(width: 8),
                Text(l10n.securedSsl256, style: const TextStyle(color: Colors.black26, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(PaymentSuccessView.routeName),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28B22),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                shadowColor: const Color(0xFFF28B22).withOpacity(0.4),
              ),
              child: Text(l10n.pay29000, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(label, style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.w500, fontSize: 14))),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}
