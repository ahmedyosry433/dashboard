import 'package:admin_dashboard/features/dashboard/presentation/widgets/all_expenses_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/income_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/my_card_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/quick_invoice_section.dart';
import 'package:flutter/material.dart';

class WebTabletLayout extends StatefulWidget {
  const WebTabletLayout({
    required this.isMobile,
    required this.isWebLayout,
    required this.isTabletLayout,
    super.key,
  });

  final bool isMobile;
  final bool isWebLayout;
  final bool isTabletLayout;

  @override
  State<WebTabletLayout> createState() => _WebTabletLayoutState();
}

class _WebTabletLayoutState extends State<WebTabletLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AllExpensesSection(
                      isTabletLayout: widget.isTabletLayout,
                      isWebLayout: widget.isWebLayout,
                      isMobile: widget.isMobile,
                    ),
                    QuickInvoiceSection(
                      isTabletLayout: widget.isTabletLayout,
                      isWebLayout: widget.isWebLayout,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardAndTransactions(
                      isTabletLayout: widget.isTabletLayout,
                      isMobile: widget.isMobile,
                      isWebLayout: widget.isWebLayout,
                    ),
                    IncomeSection(
                      isTabletLayout: widget.isTabletLayout,
                      isWebLayout: widget.isWebLayout,
                      isMobile: widget.isMobile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
