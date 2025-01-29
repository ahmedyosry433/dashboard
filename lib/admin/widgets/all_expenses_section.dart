import 'package:admin_dashboard/admin/widgets/card_widget.dart';
import 'package:admin_dashboard/core/Helper/spacing.dart';
import 'package:flutter/material.dart';

class AllExpensesSection extends StatelessWidget {
  AllExpensesSection(
      {required this.isWebLayout, required this.isTabletLayout, super.key});
  bool isWebLayout;
  bool isTabletLayout;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(top: isWebLayout || isTabletLayout ? 50 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: _buildHeader(),
          ),
          verticalSpace(10),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWebLayout || isTabletLayout ? 3 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: CardWidget(
                    index: index,
                    selectedCard: 0,
                  ),
                );
              },
            ),
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
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        DropdownButton<String>(
          value: 'Monthly',
          items: ['Monthly', 'Weekly', 'Daily']
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
