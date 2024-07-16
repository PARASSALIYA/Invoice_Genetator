import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/views/screens/homepage/invoice_page/item_page/components/textformfield.dart';

Widget itemform({
  required bool hide,
  required size,
}) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Texformfield(
            hintText: 'ItemName',
            prefixIcon: null,
            validator: (value) =>
                (value!.isEmpty) ? 'Please enter item name' : null,
            onsaved: (val) {
              PersonalGlobal.itemname = val!;
            },
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          Texformfield(
            hintText: 'ItemPrice',
            prefixIcon: const Icon(
              Icons.currency_rupee,
              size: 15,
            ),
            validator: null,
            onsaved: (val) {
              PersonalGlobal.price = val!;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Texformfield(
            hintText: 'Discount',
            prefixIcon: null,
            validator: null,
            onsaved: (val) {
              PersonalGlobal.discount = val!;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 20,
          ),
          Texformfield(
            hintText: 'TexRate',
            prefixIcon: null,
            validator: null,
            onsaved: (val) {
              PersonalGlobal.taxrate = val!;
            },
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    ),
  );
}
