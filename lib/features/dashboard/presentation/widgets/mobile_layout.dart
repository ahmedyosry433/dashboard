import 'package:admin_dashboard/features/dashboard/presentation/widgets/all_expenses_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/income_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/my_card_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/quick_invoice_section.dart';
import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({
    required this.isMobile,
    required this.isWebLayout,
    required this.isTabletLayout,
    super.key,
  });

  final bool isMobile;
  final bool isWebLayout;
  final bool isTabletLayout;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AllExpensesSection(
                isTabletLayout: isTabletLayout,
                isWebLayout: isWebLayout,
                isMobile: isMobile,
              ),
              const SizedBox(height: 20),
              QuickInvoiceSection(
                isTabletLayout: isTabletLayout,
                isWebLayout: isWebLayout,
              ),
              const SizedBox(height: 20),
              CardAndTransactions(
                isTabletLayout: isTabletLayout,
                isMobile: isMobile,
                isWebLayout: isWebLayout,
              ),
              const SizedBox(height: 20),
              IncomeSection(
                isTabletLayout: isTabletLayout,
                isWebLayout: isWebLayout,
                isMobile: isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
