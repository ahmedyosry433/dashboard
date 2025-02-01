import 'package:admin_dashboard/features/dashboard/data/models/layoutinfo_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/all_expenses_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/income_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/my_card_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/quick_invoice_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/responisive_drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutInfo = _getLayoutInfo(context, constraints);

        return Scaffold(
          key: _scaffoldKey,
          appBar: _buildAppBar(layoutInfo.isMobile),
          drawer: const ResponsiveDrawer(),
          body: _buildBody(layoutInfo),
        );
      },
    );
  }

  Widget _buildBody(LayoutInfo layoutInfo) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Row(
        children: [
          if (!layoutInfo.isMobile) const ResponsiveDrawer(),
          if (layoutInfo.isWebLayout || layoutInfo.isTabletLayout)
            _buildWebTabletLayout(layoutInfo)
          else
            _buildMobileLayout(layoutInfo),
        ],
      ),
    );
  }

  Widget _buildWebTabletLayout(LayoutInfo layoutInfo) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: layoutInfo.isWebLayout ? 3 : 2,
                    child: AllExpensesSection(
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isWebLayout: layoutInfo.isWebLayout,
                      isMobile: layoutInfo.isMobile,
                    ),
                  ),
                  Expanded(
                    flex: layoutInfo.isWebLayout ? 5 : 3,
                    child: QuickInvoiceSection(
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isWebLayout: layoutInfo.isWebLayout,
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
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isMobile: layoutInfo.isMobile,
                      isWebLayout: layoutInfo.isWebLayout,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IncomeSection(
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isWebLayout: layoutInfo.isWebLayout,
                      isMobile: layoutInfo.isMobile,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(LayoutInfo layoutInfo) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AllExpensesSection(
                isTabletLayout: layoutInfo.isTabletLayout,
                isWebLayout: layoutInfo.isWebLayout,
                isMobile: layoutInfo.isMobile,
              ),
              const SizedBox(height: 20),
              QuickInvoiceSection(
                isTabletLayout: layoutInfo.isTabletLayout,
                isWebLayout: layoutInfo.isWebLayout,
              ),
              const SizedBox(height: 20),
              CardAndTransactions(
                isTabletLayout: layoutInfo.isTabletLayout,
                isMobile: layoutInfo.isMobile,
                isWebLayout: layoutInfo.isWebLayout,
              ),
              const SizedBox(height: 20),
              IncomeSection(
                isTabletLayout: layoutInfo.isTabletLayout,
                isWebLayout: layoutInfo.isWebLayout,
                isMobile: layoutInfo.isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(bool isMobile) {
    if (!isMobile) return null;

    return AppBar(
      toolbarHeight: 50,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
    );
  }
}

LayoutInfo _getLayoutInfo(BuildContext context, BoxConstraints constraints) {
  final isMobile = ResponsiveBreakpoints.of(context).isMobile;
  final isWebLayout = constraints.maxWidth > 1200;
  final isTabletLayout =
      constraints.maxWidth > 900 && constraints.maxWidth <= 1200;

  return LayoutInfo(
    isMobile: isMobile,
    isWebLayout: isWebLayout,
    isTabletLayout: isTabletLayout,
  );
}
