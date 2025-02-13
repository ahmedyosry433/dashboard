// ignore_for_file: must_be_immutable

import 'package:admin_dashboard/core/Theme/colors.dart';
import 'package:admin_dashboard/core/Theme/style.dart';
import 'package:admin_dashboard/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickInvoiceSection extends StatelessWidget {
  QuickInvoiceSection(
      {required this.isTabletLayout, required this.isWebLayout, super.key});
  bool isWebLayout;
  bool isTabletLayout;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          SizedBox(height: isWebLayout ? 20 : 15),
          Text('Latest Transaction', style: TextStyles.font16BlueMedium),
          const SizedBox(height: 16),
          _buildTransactionList(isWebLayout),
          SizedBox(height: isWebLayout ? 20 : 15),
          Divider(
            color: Colors.grey[100],
          ),
          SizedBox(height: isWebLayout ? 20 : 15),
          _buildFormSection(isWebLayout, isTabletLayout),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Quick Invoice', style: TextStyles.font20BlueSemiBold),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionList(bool isWebLayout) {
    return SizedBox(
      height: isWebLayout ? 72 : 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildProfileCircle(
            'MA',
            'Madrani Andi',
            'Madraniadi20@gmail.com',
            isWebLayout,
          ),
          SizedBox(width: isWebLayout ? 20 : 12),
          _buildProfileCircle(
            'JN',
            'Josua Nunito',
            'Josh.Nunito@gmail.com',
            isWebLayout,
          ),
          SizedBox(width: isWebLayout ? 20 : 12),
          _buildProfileCircle(
            'M',
            'Marcus',
            'Marcus@gmail.com',
            isWebLayout,
          ),
        ],
      ),
    );
  }

  Widget _buildFormSection(bool isWebLayout, bool isTabletLayout) {
    if (isWebLayout || isTabletLayout) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildTextField('Customer name', 'Type customer name'),
                    const SizedBox(height: 16),
                    _buildTextField('Item name', 'Type customer name'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildTextField('Customer Email', 'Type customer email'),
                    const SizedBox(height: 16),
                    _buildDropdownField('Item amount', 'USD'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Add More Details',
                      style: TextStyles.font18LightBlueSemiBold,
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(flex: 2, child: _buildActionButtons()),
            ],
          ),
        ],
      );
    } else if (isTabletLayout) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildTextField('Customer name', 'Type customer name'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField('Customer Email', 'Type customer email'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField('Item name', 'Type customer name'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildDropdownField('Item amount', 'USD'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildActionButtons(),
        ],
      );
    } else {
      return Column(
        children: [
          _buildTextField('Customer name', 'Type customer name'),
          const SizedBox(height: 16),
          _buildTextField('Customer Email', 'Type customer email'),
          const SizedBox(height: 16),
          _buildTextField('Item name', 'Type customer name'),
          const SizedBox(height: 16),
          _buildDropdownField('Item amount', 'USD'),
          const SizedBox(height: 24),
          _buildActionButtons(),
        ],
      );
    }
  }

  Widget _buildProfileCircle(
    String initials,
    String name,
    String email,
    bool isWebLayout,
  ) {
    return Container(
      width: isWebLayout ? 270 : 270,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: isWebLayout ? 50 : 35,
            width: isWebLayout ? 50 : 35,
            margin: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset(ImgPath.userImgPath),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: TextStyles.font16BlueSemiBold),
              Text(email, style: TextStyles.font14GreyRegular),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.font16BlueMedium),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.font16GreyRegular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorsManager.primryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red[500]!),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red[500]!),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            style: TextStyles.font16GreyRegular,
            value: initialValue,
            items: ['USD', 'EUR', 'EG'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              initialValue = newValue!;
            },
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color: ColorsManager.darkBlueColor,
            ),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(8),
            underline: Container(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primryColor,
        padding: EdgeInsets.symmetric(
          horizontal: isWebLayout ? 48 : 32,
          vertical: isWebLayout ? 20 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Send Money',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
