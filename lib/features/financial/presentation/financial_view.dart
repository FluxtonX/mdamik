import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FinancialView extends StatelessWidget {
  const FinancialView({super.key});

  static const routeName = '/financial';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(l10n?.financialTitle ?? 'Financial',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Budget Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF28B22),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n?.totalBudget ?? 'TOTAL BUDGET',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$112k',
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n?.spent ?? 'Spent',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          const Text('\$86.8k', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(width: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n?.remaining ?? 'Remaining',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          const Text('\$25.3k', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.arrow_downward, color: Colors.white.withOpacity(0.8), size: 12),
                              const SizedBox(width: 4),
                              Text('77%', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(l10n?.consumed ?? 'consumed', style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Budget by Category
            Text(l10n?.budgetByCategory ?? 'Budget by Category',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 20),

            const _BudgetCategoryItem(
              name: 'Materials',
              percentage: 85,
              spent: 38250,
              total: 45000,
              remaining: 6750,
            ),
            const _BudgetCategoryItem(
              name: 'Labor',
              percentage: 80,
              spent: 22400,
              total: 28000,
              remaining: 5600,
            ),
            const _BudgetCategoryItem(
              name: 'Engineering',
              percentage: 80,
              spent: 12000,
              total: 15000,
              remaining: 3000,
            ),
            const _BudgetCategoryItem(
              name: 'Transport',
              percentage: 90,
              spent: 7200,
              total: 8000,
              remaining: 800,
            ),
            const _BudgetCategoryItem(
              name: 'Services',
              percentage: 80,
              spent: 4800,
              total: 6000,
              remaining: 1200,
            ),
            const _BudgetCategoryItem(
              name: 'Contingency',
              percentage: 21,
              spent: 2100,
              total: 10000,
              remaining: 7900,
            ),

            const SizedBox(height: 32),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.recentTransactions ?? 'Recent Transactions',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                TextButton(
                  onPressed: () {},
                  child: Text(l10n?.viewAll ?? 'View All',
                      style: const TextStyle(
                          color: Color(0xFFF28B22),
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 12),

            const _TransactionItem(
              title: 'Cement - 200 bags',
              date: 'Today, 2:30 PM',
              amount: '\$2,400',
              icon: Icons.receipt_long_outlined,
            ),
            const _TransactionItem(
              title: 'Mason Team Payment',
              date: 'Today, 10:15 AM',
              amount: '\$1,200',
              icon: Icons.receipt_long_outlined,
            ),
            const _TransactionItem(
              title: 'Engineering Consultation',
              date: 'Yesterday',
              amount: '\$800',
              icon: Icons.receipt_long_outlined,
            ),
            const _TransactionItem(
              title: 'Steel Rebar Delivery',
              date: '2 days ago',
              amount: '\$3,500',
              icon: Icons.receipt_long_outlined,
            ),

            const SizedBox(height: 24),

            // Warning Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFCE6D3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFFF28B22), size: 22),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n?.budgetWarning ?? '2 Categories Approaching Limit',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFFF28B22)),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n?.budgetWarningDesc ??
                              'Materials (85%) and Transport (90%) budgets need attention',
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black.withOpacity(0.4)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BudgetCategoryItem extends StatelessWidget {
  const _BudgetCategoryItem({
    required this.name,
    required this.percentage,
    required this.spent,
    required this.total,
    required this.remaining,
  });

  final String name;
  final int percentage;
  final int spent;
  final int total;
  final int remaining;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text('$percentage%', style: TextStyle(color: Colors.black.withOpacity(0.4), fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: const Color(0xFFF1F1F4),
              color: const Color(0xFFF28B22),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${_formatNumber(spent)} / \$${_formatNumber(total)}',
                style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${_formatNumber(remaining)} left',
                style: const TextStyle(color: Color(0xFFF28B22), fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000) {
      final str = number.toString();
      final buffer = StringBuffer();
      for (var i = 0; i < str.length; i++) {
        if (i > 0 && (str.length - i) % 3 == 0) buffer.write(',');
        buffer.write(str[i]);
      }
      return buffer.toString();
    }
    return number.toString();
  }
}

class _TransactionItem extends StatelessWidget {
  const _TransactionItem({
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
  });

  final String title;
  final String date;
  final String amount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(date, style: TextStyle(color: Colors.black.withOpacity(0.25), fontSize: 11, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}
