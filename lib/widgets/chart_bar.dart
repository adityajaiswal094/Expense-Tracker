import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double expensesAmount;
  final double expensesPercentOfTotal;
  const ChartBar({
    Key? key,
    required this.label,
    required this.expensesAmount,
    required this.expensesPercentOfTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            // Amount
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('₹${expensesAmount.toStringAsFixed(0)}'),
              ),
            ),

            // Spacing
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),

            // Expense Bar
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10.0,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: expensesPercentOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Spacing
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),

            // Day Initial
            SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
