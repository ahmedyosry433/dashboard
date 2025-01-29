import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class CardAndTransactions extends StatefulWidget {
  bool isWebLayout;
  bool isMobile;
  bool isTabletLayout;

  CardAndTransactions(
      {required this.isMobile,
      required this.isTabletLayout,
      required this.isWebLayout,
      super.key});
  @override
  State<CardAndTransactions> createState() => _CardAndTransactionsState();
}

class _CardAndTransactionsState extends State<CardAndTransactions> {
  int _currentCard = 0;
  final List<CardData> cards = [
    CardData(
      name: 'Syah Bandi',
      number: '0918 8124 0042 8129',
      expiry: '12/20 - 124',
      color: const Color(0xFF40A0FF),
    ),
    // Add more cards here if needed
  ];

  final List<TransactionData> transactions = [
    TransactionData(
      title: 'Cash Withdrawal',
      date: DateTime(2022, 4, 13),
      amount: 20129,
      isExpense: true,
    ),
    TransactionData(
      title: 'Landing Page project',
      date: DateTime(2022, 4, 13, 15, 30),
      amount: 2000,
      isExpense: false,
    ),
    TransactionData(
      title: 'Juni Mobile App project',
      date: DateTime(2022, 4, 13, 15, 30),
      amount: 20129,
      isExpense: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.isMobile;
    final isTablet = widget.isTabletLayout;
    final isWebLayout = widget.isWebLayout;

    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.only(top: isWebLayout || isTablet ? 30 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardSection(isMobile, isTablet),
          const Divider(),
          _buildTransactionSection(isMobile),
        ],
      ),
    );
  }

  Widget _buildCardSection(bool isMobile, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My card', style: TextStyles.font20BlueSemiBold),
        const SizedBox(height: 16),
        CarouselSlider.builder(
          itemCount: cards.length,
          options: CarouselOptions(
            aspectRatio: isMobile
                ? 16 / 9
                : isTablet
                    ? 2.5
                    : 3,
            viewportFraction: isMobile
                ? 0.9
                : isTablet
                    ? 0.7
                    : 0.5,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentCard = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildCard(cards[index]);
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: cards.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(
                  _currentCard == entry.key ? 0.9 : 0.4,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCard(CardData card) {
    return Container(
      padding: EdgeInsets.all(widget.isWebLayout ? 24 : 10),
      decoration: BoxDecoration(
        color: card.color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: card.color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name card',
              style: widget.isWebLayout
                  ? TextStyles.font16WhiteRegular
                  : TextStyles.font16WhiteRegular.copyWith(fontSize: 13)),
          Text(card.name,
              style: widget.isWebLayout
                  ? TextStyles.font20WhiteMedium
                  : TextStyles.font20WhiteMedium.copyWith(fontSize: 16)),
          const Spacer(),
          Text(card.number,
              style: widget.isWebLayout
                  ? TextStyles.font16WhiteSemiBold
                  : TextStyles.font16WhiteSemiBold.copyWith(fontSize: 13)),
          Text(card.expiry,
              style: widget.isWebLayout
                  ? TextStyles.font13WhiteRegular
                  : TextStyles.font13WhiteRegular.copyWith(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildTransactionSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Transaction History',
                style: widget.isWebLayout
                    ? TextStyles.font20BlueSemiBold
                    : TextStyles.font20BlueSemiBold.copyWith(fontSize: 17)),
            TextButton(
              onPressed: () {},
              child: Text('See all', style: TextStyles.font16LightBlueMedium),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemBuilder: (context, index) {
            return _buildTransactionItem(transactions[index], isMobile);
          },
        ),
      ],
    );
  }

  Widget _buildTransactionItem(TransactionData transaction, bool isMobile) {
    final timeFormat = DateFormat('h:mm a');
    final dateFormat = DateFormat('d MMM yyyy');

    return Container(
      padding: const EdgeInsets.all(15),
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

class CardData {
  final String name;
  final String number;
  final String expiry;
  final Color color;

  CardData({
    required this.name,
    required this.number,
    required this.expiry,
    required this.color,
  });
}

class TransactionData {
  final String title;
  final DateTime date;
  final double amount;
  final bool isExpense;

  TransactionData({
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
  });
}
