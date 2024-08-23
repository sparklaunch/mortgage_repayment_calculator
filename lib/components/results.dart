import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(19, 42, 56, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Your results",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Your results are shown below based on the information you provided. To adjust the results, edit the form and click \"Calculate Repayments\" again.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(16, 33, 43, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  const Divider(
                    thickness: 5,
                    height: 5,
                    color: Color.fromRGBO(210, 212, 34, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Your monthly repayments",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "179774",
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(204, 202, 29, 1),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          thickness: 1,
                          color: Colors.white.withOpacity(0.25),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Total you'll repay over the term",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.75),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "53932294",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
