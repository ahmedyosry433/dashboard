import 'package:admin_dashboard/features/dashboard/data/models/layoutinfo_model.dart';
import 'package:admin_dashboard/features/dashboard/presentation/screen/admin_screen.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/responisive_drawer.dart';
import 'package:admin_dashboard/features/home/bussines/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutInfo = _getLayoutInfo(context, constraints);

        return Scaffold(
            backgroundColor: Colors.grey[100],
            key: _scaffoldKey,
            appBar: _buildAppBar(layoutInfo.isMobile),
            drawer: const ResponsiveDrawer(),
            body: Row(
              children: [
                if (!layoutInfo.isMobile) const ResponsiveDrawer(),
                _buildBlocBuilder(),
              ],
            ));
      },
    );
  }

  Widget _buildBlocBuilder() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeSuccess) {
          return state.page;
        } else if (state is HomeError) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }
        return const SizedBox.shrink();
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
    final isWebLayout = constraints.maxWidth > 1200;
    final isTabletLayout =
        constraints.maxWidth > 900 && constraints.maxWidth <= 1200;

    return LayoutInfo(
      isMobile: isMobile,
      isWebLayout: isWebLayout,
      isTabletLayout: isTabletLayout,
    );
  }
}
