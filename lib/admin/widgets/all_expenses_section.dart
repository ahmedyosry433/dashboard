// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/admin/widgets/card_widget.dart';
import 'package:admin_dashboard/core/Helper/spacing.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AllExpensesSection extends StatelessWidget {
  final bool isMobile;
  final bool isWebLayout;
  final bool isTabletLayout;

  const AllExpensesSection({
    super.key,
    required this.isMobile,
    required this.isWebLayout,
    required this.isTabletLayout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isWebLayout || isTabletLayout ? 20 : 10),
      margin: EdgeInsets.only(top: isWebLayout || isTabletLayout ? 30 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: _buildHeader(),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: isMobile || isTabletLayout
                ? _buildMobileTabletLayout()
                : _buildDesktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'All Expenses',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Monthly',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTabletLayout() {
    return const Column(
      children: [
        // First row with two cards
        Row(
          children: [
            Expanded(
              child: CardWidget(
                index: 0,
                selectedCard: 0,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: CardWidget(
                index: 1,
                selectedCard: 0,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Second row with one card
        CardWidget(
          index: 2,
          selectedCard: 0,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          child: CardWidget(
            index: 0,
            selectedCard: 0,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CardWidget(
            index: 1,
            selectedCard: 0,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CardWidget(
            index: 2,
            selectedCard: 0,
          ),
        ),
      ],
    );
  }
}
