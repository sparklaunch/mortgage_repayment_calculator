import 'package:flutter/material.dart';

class MortgageAmountTextfield extends StatefulWidget {
  final void Function(String amountString) onMortgageAmountChanged;
  double? mortgageAmount;
  MortgageAmountTextfield(this.mortgageAmount,
      {super.key, required this.onMortgageAmountChanged});
  @override
  State<MortgageAmountTextfield> createState() =>
      _MortgageAmountTextfieldState();
}

class _MortgageAmountTextfieldState extends State<MortgageAmountTextfield> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mortgage Amount",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(19, 42, 56, 1),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(174, 184, 190, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(222, 243, 252, 1),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "£",
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromRGBO(19, 42, 56, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    textEditingController.addListener(() {
      widget.onMortgageAmountChanged(textEditingController.text);
    });
    super.initState();
  }
}
