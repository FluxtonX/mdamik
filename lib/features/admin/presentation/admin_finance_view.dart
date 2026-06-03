import 'package:flutter/material.dart';

class AdminFinanceView extends StatefulWidget {
  const AdminFinanceView({super.key});

  @override
  State<AdminFinanceView> createState() => _AdminFinanceViewState();
}

class _AdminFinanceViewState extends State<AdminFinanceView> {
  int _selectedFilter = 0;

  final List<String> _filters = [
    'All',
    'Paid',
    'Pending',
    'Failed',
    'Refunded'
  ];

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F0),
      body: CustomScrollView(
        slivers: [
          // White Header
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: top + 16,
                left: 20,
                right: 20,
                bottom: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Finance',
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F4F0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: Color(0xFF1A1A1A),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Stats Grid
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            sliver: SliverToBoxAdapter(
              child: GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.45,
                children: const [
                  _FinanceStatCard(
                    icon: Icons.attach_money,
                    value: '\$45.2K',
                    label: 'Total Revenue',
                    change: '+18%',
                  ),
                  _FinanceStatCard(
                    icon: Icons.credit_card_outlined,
                    value: '\$8.5K',
                    label: 'Pending Payments',
                  ),
                  _FinanceStatCard(
                    icon: Icons.autorenew_outlined,
                    value: '\$2.1K',
                    label: 'Refunds Processed',
                  ),
                  _FinanceStatCard(
                    icon: Icons.call_made_outlined,
                    value: '\$4.5K',
                    label: 'Commission',
                    change: '+12%',
                  ),
                ],
              ),
            ),
          ),

          // Filters Row
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 20),
              child: SizedBox(
                height: 36,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedFilter == index;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedFilter = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFE8711A)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFE8711A)
                                : const Color(0xFFD9D9D9),
                          ),
                        ),
                        child: Text(
                          _filters[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF8A8A8A),
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Transactions Title
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),

          // Transactions List
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate(const [
                _TransactionCard(
                  title: 'Material Order',
                  name: 'Ahmed Hassan',
                  status: 'Paid',
                  method: 'Card',
                  date: 'Jun 1, 2026',
                  amount: '+\$450.00',
                  isPositive: true,
                ),
                SizedBox(height: 12),
                _TransactionCard(
                  title: 'Labor Booking',
                  name: 'Sarah Ali',
                  status: 'Paid',
                  method: 'Wallet',
                  date: 'Jun 1, 2026',
                  amount: '+\$200.00',
                  isPositive: true,
                ),
                SizedBox(height: 12),
                _TransactionCard(
                  title: 'Refund',
                  name: 'Mohammed Khalid',
                  status: 'Refunded',
                  method: 'Card',
                  date: 'May 31, 2026',
                  amount: '-\$350.00',
                  isPositive: false,
                ),
                SizedBox(height: 12),
                _TransactionCard(
                  title: 'Engineering Service',
                  name: 'Fatima Omar',
                  status: 'Pending',
                  method: 'Bank',
                  date: 'May 31, 2026',
                  amount: '+\$800.00',
                  isPositive: true,
                ),
                SizedBox(height: 12),
                _TransactionCard(
                  title: 'Transport Booking',
                  name: 'Salem Rashid',
                  status: 'Paid',
                  method: 'Card',
                  date: 'May 30, 2026',
                  amount: '+\$120.00',
                  isPositive: true,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────────────────

class _FinanceStatCard extends StatelessWidget {
  const _FinanceStatCard({
    required this.icon,
    required this.value,
    required this.label,
    this.change,
  });

  final IconData icon;
  final String value;
  final String label;
  final String? change;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: const Color(0xFFE8711A), size: 24),
              if (change != null)
                Text(
                  change!,
                  style: const TextStyle(
                    color: Color(0xFF00A859), // Green color for positive change
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8A8A8A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Transaction Card ──────────────────────────────────────────────────────────

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({
    required this.title,
    required this.name,
    required this.status,
    required this.method,
    required this.date,
    required this.amount,
    required this.isPositive,
  });

  final String title;
  final String name;
  final String status;
  final String method;
  final String date;
  final String amount;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8A8A8A),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7E6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Color(0xFFD48B1B),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      method,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFB0B0B0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isPositive
                      ? const Color(0xFF00A859)
                      : const Color(0xFFE20000),
                ),
              ),
              const SizedBox(height: 4),
              Icon(
                isPositive ? Icons.call_made : Icons.call_received,
                color: isPositive
                    ? const Color(0xFF00A859)
                    : const Color(0xFFE20000),
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
