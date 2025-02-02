// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/features/dashboard/data/models/card_model.dart';
import 'package:admin_dashboard/features/dashboard/data/models/transaction_model.dart';
import 'package:admin_dashboard/features/dashboard/presentation/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  final List<CardModel> cards = [
    CardModel(
      name: 'Syah Bandi',
      number: '0918 8124 0042 8129',
      expiry: '12/20 - 124',
      color: const Color(0xFF40A0FF),
    ),
    CardModel(
      name: 'Ahmed Yosry',
      number: '0918 8124 0042 8129',
      expiry: '12/20 - 124',
      color: ColorsManager.darkBlueColor,
    ),
  ];

  final List<TransactionModel> transactions = [
    TransactionModel(
      title: 'Cash Withdrawal',
      date: DateTime(2022, 4, 13),
      amount: 20129,
      isExpense: true,
    ),
    TransactionModel(
      title: 'Landing Page project',
      date: DateTime(2022, 4, 13, 15, 30),
      amount: 2000,
      isExpense: false,
    ),
    TransactionModel(
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

    return Container(
      padding: const EdgeInsets.all(20),
      // margin: EdgeInsets.only(top: isWebLayout || isTablet ? 30 : 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCardSection(isMobile, isTablet),
          Divider(
            color: Colors.grey[100],
          ),
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
                    : 2.50,
            viewportFraction: 1,
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

        // Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: cards.asMap().entries.map((entry) {
            return Container(
              width: _currentCard == entry.key ? 30 : 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(_currentCard == entry.key ? 10 : 50),
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

  Widget _buildCard(CardModel card) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(widget.isWebLayout ? 10 : 2),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/card_shap.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.isWebLayout ? 8.0 : 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name card',
                style: widget.isWebLayout
                    ? TextStyles.font14WhiteRegular.copyWith(fontSize: 12)
                    : TextStyles.font16WhiteRegular.copyWith(fontSize: 10)),
            Text(card.name,
                style: widget.isWebLayout
                    ? TextStyles.font16WhiteMedium.copyWith(fontSize: 14)
                    : TextStyles.font20WhiteMedium.copyWith(fontSize: 12)),
            const Spacer(),
            Text(card.number,
                style: widget.isWebLayout
                    ? TextStyles.font14WhiteRegular
                    : TextStyles.font14WhiteRegular.copyWith(fontSize: 10)),
            Text(card.expiry,
                style: widget.isWebLayout
                    ? TextStyles.font13WhiteRegular.copyWith(fontSize: 11)
                    : TextStyles.font13WhiteRegular.copyWith(fontSize: 8)),
          ],
        ),
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
              child: Text('See all',
                  style: TextStyles.font16BlueRegular.copyWith(fontSize: 13)),
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
            return TransactionWidget(
                transaction: transactions[index], isMobile: isMobile);
          },
        ),
      ],
    );
  }
}
