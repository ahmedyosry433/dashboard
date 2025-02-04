import 'dart:developer';

import 'package:admin_dashboard/core/Router/routes.dart';
import 'package:admin_dashboard/core/component/side_bar.dart';
import 'package:admin_dashboard/core/flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarWidget sideBar = SideBarWidget();

    log(" m : ${MediaQuery.of(context).size.width}");
    return AdminScaffold(
      sideBar: sideBar.sideBarMenus(context, Routes.walletScreen),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 20),
            _buildTransactionList(),
            const SizedBox(height: 20),
            _buildAddMoneyButton(),
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
            Text("\$8,750",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Expanded(
      child: ListView(
        children: [
          _buildTransactionItem("Starbucks", "-\$5.50", Colors.red),
          _buildTransactionItem("Salary", "+\$3,000", Colors.green),
          _buildTransactionItem("Amazon", "-\$120", Colors.red),
          _buildTransactionItem("Investment", "+\$500", Colors.green),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: color,
            child: const Icon(Icons.monetization_on, color: Colors.white)),
        title: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(amount, style: TextStyle(fontSize: 16, color: color)),
      ),
    );
  }

  Widget _buildAddMoneyButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: const Text("Add Money", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
