import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:admin_dashboard/features/home/bussines/cubit/home_cubit.dart';
import 'package:admin_dashboard/features/dashboard/data/models/layoutinfo_model.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/responisive_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _bucket,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final layoutInfo = _getLayoutInfo(context, constraints);

          return Scaffold(
            backgroundColor: Colors.grey[100],
            key: _scaffoldKey,
            appBar: _buildAppBar(layoutInfo.isMobile),
            drawer: layoutInfo.isMobile ? const ResponsiveDrawer() : null,
            body: Row(
              children: [
                if (!layoutInfo.isMobile) const ResponsiveDrawer(),
                Expanded(child: _buildBlocBuilder()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBlocBuilder() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeSuccess) return state.page;
        if (state is HomeError) return Center(child: Text(state.errorMessage));
        return const SizedBox();
      },
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

  LayoutInfo _getLayoutInfo(BuildContext context, BoxConstraints constraints) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return LayoutInfo(
      isMobile: isMobile,
      isWebLayout: constraints.maxWidth > 1200,
      isTabletLayout:
          constraints.maxWidth > 900 && constraints.maxWidth <= 1200,
    );
  }
}
