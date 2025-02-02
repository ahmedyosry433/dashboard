import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/component/side_bar.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_scaffold.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarWidget sideBar = SideBarWidget();

    return AdminScaffold(
      backgroundColor: Colors.grey[100],
      sideBar: sideBar.sideBarMenus(context, Routes.investmentScreen),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildChart(),
            const SizedBox(height: 20),
            _buildInvestmentList(),
            const SizedBox(height: 20),
            _buildInvestButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Balance",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 8),
            Text("\$12,500",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 1),
                const FlSpot(1, 1.5),
                const FlSpot(2, 1.4),
                const FlSpot(3, 3.4),
                const FlSpot(4, 2),
                const FlSpot(5, 2.2),
                const FlSpot(6, 2.8),
              ],
              isCurved: true,
              barWidth: 3,
              isStrokeCapRound: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentList() {
    return Column(
      children: [
        _buildInvestmentCard("Bitcoin", "\$4,500", Colors.orange),
        _buildInvestmentCard("Ethereum", "\$3,200", Colors.blueAccent),
        _buildInvestmentCard("Apple Stock", "\$2,800", Colors.green),
      ],
    );
  }

  Widget _buildInvestmentCard(String title, String amount, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: color,
            child: Text(title[0], style: const TextStyle(color: Colors.white))),
        title: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(amount,
            style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ),
    );
  }

  Widget _buildInvestButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text("Invest Now", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
