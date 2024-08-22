import 'package:flutter/material.dart';
import 'package:mortgage_repayment_calculator/components/mortgage_amount_textfield.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double? mortgageAmount;
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
                    onMortgageAmountChanged: onMortgageAmountChanged,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onMortgageAmountChanged(String amountString) {
    final amount = double.tryParse(amountString);
    setState(() {
      mortgageAmount = amount;
    });
  }
}
