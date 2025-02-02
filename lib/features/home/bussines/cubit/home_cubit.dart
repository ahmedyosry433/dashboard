// ignore_for_file: depend_on_referenced_packages

import 'package:admin_dashboard/features/dashboard/presentation/screen/admin_screen.dart';
import 'package:admin_dashboard/features/invoices/presentation/view/invesment_screen.dart';
import 'package:admin_dashboard/features/wallet/presentation/view/wallet_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeSuccess(const DashboardScreen())); // Start with initial page

  int selectedIndex = 0;

  final List<Widget> pages = [
    const DashboardScreen(),
    const InvestmentScreen(),
    const WalletScreen(),
    const InvestmentScreen(),
  ];

  void navigateToPage(int index) {
    emit(HomeLoading());
    if (index >= 0 && index < pages.length) {
      selectedIndex = index;
      emit(HomeSuccess(pages[index]));
    } else {
      emit(HomeError(errorMessage: 'Invalid page index'));
    }
  }
}
