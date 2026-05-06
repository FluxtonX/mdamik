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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF1F1F4)),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back,
                  color: Color(0xFFF28B22), size: 18),
            ),
          ),
        ),
        title: Text(l10n?.financialTitle ?? 'Financial',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Budget Banner with Gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF28B22), Color(0xFFE67E22)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF28B22).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n?.totalBudget ?? 'TOTAL BUDGET',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.budgetTotalSample ?? '\$112k',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n?.spent ?? 'Spent',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          Text(l10n?.budgetSpentSample ?? '\$86.8k',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n?.remaining ?? 'Remaining',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          Text(l10n?.budgetRemainingSample ?? '\$25.3k',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.trending_down,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 14),
                              const SizedBox(width: 4),
                              Text(l10n?.budgetConsumedPercentSample ?? '77%',
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(l10n?.consumed ?? 'Consumed',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500)),
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),

            _BudgetCategoryItem(
              name: l10n?.materials ?? 'Materials',
              percentage: 85,
              spent: 38250,
              total: 45000,
              remaining: 6750,
            ),
            _BudgetCategoryItem(
              name: l10n?.labor ?? 'Labor',
              percentage: 80,
              spent: 22400,
              total: 28000,
              remaining: 5600,
            ),
            _BudgetCategoryItem(
              name: l10n?.engineeringTitle ?? 'Engineering',
              percentage: 80,
              spent: 12000,
              total: 15000,
              remaining: 3000,
            ),
            _BudgetCategoryItem(
              name: l10n?.transport ?? 'Transport',
              percentage: 90,
              spent: 7200,
              total: 8000,
              remaining: 800,
            ),
            _BudgetCategoryItem(
              name: l10n?.services ?? 'Services',
              percentage: 80,
              spent: 4800,
              total: 6000,
              remaining: 1200,
            ),
            _BudgetCategoryItem(
              name: l10n?.catContingency ?? 'Contingency',
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
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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

            _TransactionItem(
              title: l10n?.transactionCement200Bags ?? 'Cement - 200 bags',
              date: l10n?.transactionToday230pm ?? 'Today, 2:30 PM',
              amount: l10n?.amount2400 ?? '\$2,400',
            ),
            _TransactionItem(
              title:
                  l10n?.transactionMasonTeamPayment ?? 'Mason Team Payment',
              date: l10n?.transactionToday1015am ?? 'Today, 10:15 AM',
              amount: l10n?.amount1200 ?? '\$1,200',
            ),
            _TransactionItem(
              title: l10n?.transactionEngineeringConsultation ??
                  'Engineering Consultation',
              date: l10n?.transactionYesterday ?? 'Yesterday',
              amount: l10n?.amount800 ?? '\$800',
            ),
            _TransactionItem(
              title: l10n?.transactionSteelRebarDelivery ??
                  'Steel Rebar Delivery',
              date: l10n?.transactionTwoDaysAgo ?? '2 days ago',
              amount: l10n?.amount3500 ?? '\$3,500',
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
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.warning_amber_rounded,
                        color: Color(0xFFF28B22), size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n?.budgetWarning ?? '2 Categories Approaching Limit',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
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
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text.rich(
                TextSpan(
                  text: percentage.toString(),
                  children: [
                    TextSpan(text: l10n.percentSymbol),
                  ],
                ),
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: const Color(0xFFF1F1F4),
              color: const Color(0xFFF28B22),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${_formatNumber(spent)} / \$${_formatNumber(total)}',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '\$${_formatNumber(remaining)} ${l10n.left}',
                style: const TextStyle(
                    color: Color(0xFFF28B22),
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
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
  });

  final String title;
  final String date;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFEE7E7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.trending_down,
                color: Color(0xFFE53935), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text(date,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Text(amount,
              style: const TextStyle(
                  color: Color(0xFFE53935),
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ],
      ),
    );
  }
}
