import 'package:admin_dashboard/admin/widgets/all_expenses_section.dart';
import 'package:admin_dashboard/admin/widgets/card_widget.dart';
import 'package:admin_dashboard/admin/widgets/income_section.dart';
import 'package:admin_dashboard/admin/widgets/my_card_section.dart';
import 'package:admin_dashboard/admin/widgets/quick_invoice.dart';
import 'package:admin_dashboard/admin/widgets/responisive_drawer.dart';
import 'package:admin_dashboard/core/Helper/spacing.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: isMobile ? 50 : 0,
          leading: isMobile
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                )
              : null,
        ),
        drawer: isMobile ? const ResponsiveDrawer() : null,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isWebLayout = constraints.maxWidth > 1200;
            final isTabletLayout =
                constraints.maxWidth > 600 && constraints.maxWidth <= 1200;

            return Scaffold(
              backgroundColor: Colors.grey[100],
              body: Row(
                children: [
                  if (isWebLayout || isTabletLayout) const ResponsiveDrawer(),
                  if (isWebLayout || isTabletLayout)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: AllExpensesSection(
                                      isTabletLayout: isTabletLayout,
                                      isWebLayout: isWebLayout,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: QuickInvoiceSection(
                                      isTabletLayout: isTabletLayout,
                                      isWebLayout: isWebLayout,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CardAndTransactions(
                                      isTabletLayout: isTabletLayout,
                                      isMobile: isMobile,
                                      isWebLayout: isWebLayout,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IncomeSection(
                                        isTabletLayout: isTabletLayout,
                                        isWebLayout: isWebLayout,
                                        isMobile: isMobile,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isMobile)
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [
                        AllExpensesSection(
                            isTabletLayout: isTabletLayout,
                            isWebLayout: isWebLayout),
                        QuickInvoiceSection(
                            isTabletLayout: isTabletLayout,
                            isWebLayout: isWebLayout),
                        QuickInvoiceSection(
                            isTabletLayout: isTabletLayout,
                            isWebLayout: isWebLayout),
                        AllExpensesSection(
                            isTabletLayout: isTabletLayout,
                            isWebLayout: isWebLayout),
                        IncomeSection(
                          isTabletLayout: isTabletLayout,
                          isWebLayout: isWebLayout,
                          isMobile: isMobile,
                        ),
                      ]),
                    ),
                ],
              ),
            );
          },
        ));
  }
}
