// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeSection extends StatelessWidget {
  final List<IncomeData> incomeData = [
    IncomeData('Design service', 40, const Color(0xFF0066FF)),
    IncomeData('Design product', 25, const Color(0xFF69B4FF)),
    IncomeData('Product royalti', 20, const Color(0xFF142B4B)),
    IncomeData('Other', 22, const Color(0xFFE8ECF4)),
  ];

  bool isWebLayout;
  bool isTabletLayout;
  bool isMobile;

  IncomeSection(
      {required this.isTabletLayout,
      required this.isWebLayout,
      required this.isMobile,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(isMobile),
              const SizedBox(height: 24),
              _buildContent(isMobile, isTabletLayout),
            ],
          ),
        ));
  }

  Widget _buildHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Income', style: TextStyles.font20BlueSemiBold),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Monthly'),
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

  Widget _buildContent(bool isMobile, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: isWebLayout ? 150 : (isTablet ? 100 : 130),
          width: isWebLayout ? 150 : (isTablet ? 100 : 130),
          child: PieChart(
            PieChartData(
              sections: incomeData
                  .map((data) => PieChartSectionData(
                        value: data.percentage,
                        color: data.color,
                        title: '',
                        radius: isWebLayout ? 30 : (isTablet ? 25 : 20),
                      ))
                  .toList(),
              sectionsSpace: 0,
              centerSpaceRadius: isWebLayout ? 50 : (isTablet ? 30 : 20),
            ),
          ),
        ),
        SizedBox(width: isWebLayout ? 80 : (isTablet ? 20 : 10)),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: incomeData
                .map((data) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: data.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(data.name,
                                style: TextStyles.font16BlueRegular),
                          ),
                          Text('${data.percentage}%',
                              style: TextStyles.font16LightBlueRegular),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class IncomeData {
  final String name;
  final double percentage;
  final Color color;

  IncomeData(this.name, this.percentage, this.color);
}
