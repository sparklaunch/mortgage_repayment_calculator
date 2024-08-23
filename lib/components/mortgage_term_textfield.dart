import 'package:flutter/material.dart';

class MortgageTermTextfield extends StatefulWidget {
  final void Function(String stringAmount) onMortgageTermChanged;
  const MortgageTermTextfield({super.key, required this.onMortgageTermChanged});
  @override
  State<MortgageTermTextfield> createState() => _MortgageTermTextfieldState();
}

class _MortgageTermTextfieldState extends State<MortgageTermTextfield> {
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Mortgage Term",
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(60, 83, 95, 1),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: const Color.fromRGBO(159, 170, 174, 1),
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
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(225, 242, 250, 1),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "years",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
      widget.onMortgageTermChanged(textEditingController.text);
    });
    super.initState();
  }
}
