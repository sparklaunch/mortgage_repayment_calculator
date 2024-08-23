import 'package:flutter/material.dart';

class InterestRateTextfield extends StatefulWidget {
  final void Function(String rateString) onInterestRateChanged;
  const InterestRateTextfield({super.key, required this.onInterestRateChanged});
  @override
  State<InterestRateTextfield> createState() => _InterestRateTextfieldState();
}

class _InterestRateTextfieldState extends State<InterestRateTextfield> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Interest Rate",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(85, 96, 102, 1),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(147, 162, 169, 1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(227, 246, 255, 1),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "%",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(19, 42, 56, 1),
                    ),
                  ),
                ),
              )
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
      widget.onInterestRateChanged(textEditingController.text);
    });
    super.initState();
  }
}
