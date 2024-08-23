import 'package:flutter/material.dart';
import 'package:mortgage_repayment_calculator/models/mortgage.dart';

class MortgageType extends StatefulWidget {
  final Mortgage? mortgage;
  final void Function(Mortgage? mortgage) onMortgageChanged;
  const MortgageType(
      {super.key, required this.mortgage, required this.onMortgageChanged});
  @override
  State<MortgageType> createState() => _MortgageTypeState();
}

class _MortgageTypeState extends State<MortgageType> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Mortgage Type",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(19, 42, 56, 1),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(184, 192, 197, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: const Text(
              "Repayment",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(19, 42, 56, 1),
              ),
            ),
            leading: Radio(
              activeColor: const Color.fromRGBO(19, 42, 56, 1),
              value: Mortgage.repayment,
              groupValue: widget.mortgage,
              onChanged: (value) {
                setState(
                  () {
                    widget.onMortgageChanged(value);
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(184, 192, 197, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: const Text(
              "Interest Only",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(19, 42, 56, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: Radio(
              activeColor: const Color.fromRGBO(19, 42, 56, 1),
              value: Mortgage.interestOnly,
              groupValue: widget.mortgage,
              onChanged: (value) {
                setState(
                  () {
                    widget.onMortgageChanged(value);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
