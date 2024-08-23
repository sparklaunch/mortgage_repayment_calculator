import 'package:flutter/material.dart';
import 'package:mortgage_repayment_calculator/components/interest_rate_textfield.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_amount_textfield.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_term_textfield.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_type.dart';
import 'package:mortgage_repayment_calculator/models/mortgage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double? mortgageAmount;
  int? mortgageTerm;
  double? interestRate;
  Mortgage? mortgage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mortgage Calculator",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(19, 42, 56, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                    ),
                    child: const Text(
                      "Clear All",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(19, 42, 56, 1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MortgageAmountTextfield(
                    mortgageAmount,
                    onMortgageAmountChanged: onMortgageAmountChanged,
                  ),
                  const SizedBox(height: 20),
                  MortgageTermTextfield(
                    onMortgageTermChanged: onMortgageTermChanged,
                  ),
                  const SizedBox(height: 20),
                  InterestRateTextfield(
                    onInterestRateChanged: onInterestRateChanged,
                  ),
                  const SizedBox(height: 20),
                  MortgageType(
                    mortgage: mortgage,
                    onMortgageChanged: onMortgageChanged,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onInterestRateChanged(String rateString) {
    final filteredRate = rateString.replaceAll(RegExp("[A-Za-z]"), "");
    final amount = double.tryParse(filteredRate);
    setState(() {
      interestRate = amount;
    });
  }

  void onMortgageAmountChanged(String amountString) {
    final filteredAmount = amountString.replaceAll(RegExp("[A-Za-z]"), "");
    final amount = double.tryParse(filteredAmount);
    setState(() {
      mortgageAmount = amount;
    });
  }

  void onMortgageChanged(Mortgage? mortgageValue) {
    setState(() {
      mortgage = mortgageValue;
    });
  }

  void onMortgageTermChanged(String amountString) {
    final filteredAmount = amountString.replaceAll(RegExp("[A-Za-z]"), "");
    final amount = int.tryParse(filteredAmount);
    setState(() {
      mortgageTerm = amount;
    });
  }
}
