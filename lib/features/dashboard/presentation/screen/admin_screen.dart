import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/component/side_bar.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_scaffold.dart';
import 'package:admin_dashboard/features/dashboard/data/models/layoutinfo_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/all_expenses_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/income_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/my_card_section.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/quick_invoice_section.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageStorageBucket _bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    SideBarWidget sideBar = SideBarWidget();

    return PageStorage(
        bucket: _bucket,
        child: LayoutBuilder(builder: (context, constraints) {
          final layoutInfo = _getLayoutInfo(context);

          return AdminScaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.grey[100],
              sideBar: sideBar.sideBarMenus(context, Routes.dashboardScreen),
              appBar: AppBar(
                backgroundColor: Colors.white,
              ),
              body: _buildBody(layoutInfo));
        }));
  }

  Widget _buildBody(LayoutInfo layoutInfo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (layoutInfo.isWebLayout || layoutInfo.isTabletLayout)
          _buildWebTabletLayout(layoutInfo)
        else
          _buildMobileLayout(layoutInfo),
      ],
    );
  }

  Widget _buildWebTabletLayout(LayoutInfo layoutInfo) {
    return Expanded(
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
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isWebLayout: layoutInfo.isWebLayout,
                      isMobile: layoutInfo.isMobile,
                    ),
                    QuickInvoiceSection(
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isWebLayout: layoutInfo.isWebLayout,
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
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isMobile: layoutInfo.isMobile,
                      isWebLayout: layoutInfo.isWebLayout,
                    ),
                    IncomeSection(
                      isTabletLayout: layoutInfo.isTabletLayout,
                      isWebLayout: layoutInfo.isWebLayout,
                      isMobile: layoutInfo.isMobile,
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

  LayoutInfo _getLayoutInfo(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isWebLayout = ResponsiveBreakpoints.of(context).isDesktop;
    final isTabletLayout = ResponsiveBreakpoints.of(context).isTablet;

    return LayoutInfo(
      isMobile: isMobile,
      isWebLayout: isWebLayout,
      isTabletLayout: isTabletLayout,
    );
  }
}
