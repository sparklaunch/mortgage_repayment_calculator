import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mortgage_repayment_calculator/components/empty.dart';
import 'package:mortgage_repayment_calculator/components/interest_rate_textfield.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_amount_textfield.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_term_textfield.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_type.dart';
import 'package:mortgage_repayment_calculator/components/results.dart';
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
  bool get isEmpty {
    return mortgageAmount == null ||
        mortgageTerm == null ||
        interestRate == null ||
        mortgage == null;
  }

  double get monthlyRepayments {
    return mortgageAmount! * mortgageTerm!.toDouble() * interestRate!;
  }

  double get total {
    return monthlyRepayments;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    onPressed: clearAll,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.centerLeft,
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
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: calculateRepayments,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(212, 214, 42, 1),
                      foregroundColor: const Color.fromRGBO(19, 42, 56, 1),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "PlusJakartaSans",
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                    icon: SvgPicture.asset(
                      "assets/images/Calculator.svg",
                    ),
                    label: const Text("Calculate Repayments"),
                  )
                ],
              ),
            ),
            if (isEmpty)
              const Empty()
            else
              Results(monthlyRepayments: monthlyRepayments, total: total),
          ],
        ),
      ),
    );
  }

  void calculateRepayments() {}

  void clearAll() {}

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
