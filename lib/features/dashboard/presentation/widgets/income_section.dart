// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/features/dashboard/data/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeSection extends StatefulWidget {
  bool isWebLayout;
  bool isTabletLayout;
  bool isMobile;

  IncomeSection(
      {required this.isTabletLayout,
      required this.isWebLayout,
      required this.isMobile,
      super.key});

  @override
  State<IncomeSection> createState() => _IncomeSectionState();
}

class _IncomeSectionState extends State<IncomeSection> {
  final List<IncomeModel> incomeData = [
    IncomeModel('Design service', 40, const Color(0xFF0066FF)),
    IncomeModel('Design product', 25, const Color(0xFF69B4FF)),
    IncomeModel('Product royalti', 20, const Color(0xFF142B4B)),
    IncomeModel('Other', 22, const Color(0xFFE8ECF4)),
  ];

  String _filterOption = 'Monthly';

  final List<String> _filterOptions = ['Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(widget.isMobile),
              const SizedBox(height: 10),
              _buildContent(widget.isMobile, widget.isTabletLayout),
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
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
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

  Widget _buildContent(bool isMobile, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: widget.isWebLayout ? 50 : (isTablet ? 80 : 100),
            width: widget.isWebLayout ? 50 : (isTablet ? 80 : 100),
            child: PieChart(
              PieChartData(
                sections: incomeData
                    .map((data) => PieChartSectionData(
                          value: data.percentage,
                          color: data.color,
                          title: '',
                          radius:
                              widget.isWebLayout ? 30 : (isTablet ? 25 : 20),
                        ))
                    .toList(),
                sectionsSpace: 0,
                centerSpaceRadius:
                    widget.isWebLayout ? 30 : (isTablet ? 30 : 20),
              ),
            ),
          ),
        ),
        SizedBox(width: widget.isWebLayout ? 30 : (isTablet ? 20 : 10)),
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
                          const SizedBox(width: 8),
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
