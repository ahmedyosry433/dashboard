// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/admin/widgets/card_widget.dart';
import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:flutter/material.dart';

class AllExpensesSection extends StatefulWidget {
  final bool isMobile;
  final bool isWebLayout;
  final bool isTabletLayout;

  AllExpensesSection({
    super.key,
    required this.isMobile,
    required this.isWebLayout,
    required this.isTabletLayout,
  });

  @override
  State<AllExpensesSection> createState() => _AllExpensesSectionState();
}

class _AllExpensesSectionState extends State<AllExpensesSection> {
  String _filterOption = 'Monthly';

  final List<String> _filterOptions = ['Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.all(widget.isWebLayout || widget.isTabletLayout ? 20 : 10),
      margin: EdgeInsets.only(
          top: widget.isWebLayout || widget.isTabletLayout ? 30 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: _buildHeader(context),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: widget.isMobile
                ? _buildMobileTabletLayout()
                : _buildWebLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All Expenses',
          style: TextStyles.font20BlueSemiBold,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: DropdownButton<String>(
            value: _filterOption,
            items: _filterOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _filterOption = newValue;
                });
              }
            },
            underline: Container(),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: ColorsManager.darkBlueColor,
            ),
            style: TextStyles.font16BlueSemiBold,
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
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
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CardWidget(
                index: 2,
                selectedCard: 0,
              ),
            ),
            Expanded(flex: 1, child: SizedBox(height: 16)),
          ],
        ),
      ],
    );
  }

  Widget _buildWebLayout() {
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
