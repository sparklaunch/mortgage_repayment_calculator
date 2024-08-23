import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(19, 42, 56, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            SvgPicture.asset("assets/images/Empty.svg"),
            const SizedBox(height: 20),
            const Text(
              "Results shown here",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              "Complete the form and click \"Calculate Repayments\" to see what your monthly repayments would be.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.75),
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
