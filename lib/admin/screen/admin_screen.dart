import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:admin_dashboard/admin/widgets/all_expenses_section.dart';
import 'package:admin_dashboard/admin/widgets/income_section.dart';
import 'package:admin_dashboard/admin/widgets/my_card_section.dart';
import 'package:admin_dashboard/admin/widgets/quick_invoice.dart';
import 'package:admin_dashboard/admin/widgets/responisive_drawer.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

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
          drawer: ResponsiveDrawer(),
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
          if (!layoutInfo.isMobile) ResponsiveDrawer(),
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
                    child: _buildAllExpensesSection(layoutInfo),
                  ),
                  Expanded(
                    flex: layoutInfo.isWebLayout ? 5 : 3,
                    child: _buildQuickInvoiceSection(layoutInfo),
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
                    child: _buildCardAndTransactions(layoutInfo),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildIncomeSection(layoutInfo),
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
              _buildAllExpensesSection(layoutInfo),
              const SizedBox(height: 20),
              _buildQuickInvoiceSection(layoutInfo),
              const SizedBox(height: 20),
              _buildCardAndTransactions(layoutInfo),
              const SizedBox(height: 20),
              _buildIncomeSection(layoutInfo),
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

  Widget _buildAllExpensesSection(LayoutInfo layoutInfo) {
    return AllExpensesSection(
      isTabletLayout: layoutInfo.isTabletLayout,
      isWebLayout: layoutInfo.isWebLayout,
      isMobile: layoutInfo.isMobile,
    );
  }

  Widget _buildQuickInvoiceSection(LayoutInfo layoutInfo) {
    return QuickInvoiceSection(
      isTabletLayout: layoutInfo.isTabletLayout,
      isWebLayout: layoutInfo.isWebLayout,
    );
  }

  Widget _buildCardAndTransactions(LayoutInfo layoutInfo) {
    return CardAndTransactions(
      isTabletLayout: layoutInfo.isTabletLayout,
      isMobile: layoutInfo.isMobile,
      isWebLayout: layoutInfo.isWebLayout,
    );
  }

  Widget _buildIncomeSection(LayoutInfo layoutInfo) {
    return IncomeSection(
      isTabletLayout: layoutInfo.isTabletLayout,
      isWebLayout: layoutInfo.isWebLayout,
      isMobile: layoutInfo.isMobile,
    );
  }
}

class LayoutInfo {
  final bool isMobile;
  final bool isWebLayout;
  final bool isTabletLayout;

  const LayoutInfo({
    required this.isMobile,
    required this.isWebLayout,
    required this.isTabletLayout,
  });
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
