import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/features/dashboard/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
    required this.isMobile,
  });

  final TransactionModel transaction;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('h:mm a');
    final dateFormat = DateFormat('d MMM yyyy');

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title, style: TextStyles.font16BlueSemiBold),
                const SizedBox(height: 4),
                Text(
                    isMobile
                        ? dateFormat.format(transaction.date)
                        : '${dateFormat.format(transaction.date)} at ${timeFormat.format(transaction.date)}',
                    style: TextStyles.font14GreyRegular),
              ],
            ),
          ),
          Text(
            '${transaction.isExpense ? '-' : '+'}\$${transaction.amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: transaction.isExpense ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
