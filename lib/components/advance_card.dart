import 'package:flutter/material.dart';

List<Widget> advanceCardList = [];

void advanceCardAdder() {
  advanceCardList.add(
    AdvanceCard(),
  );
}

class AdvanceCard extends StatefulWidget {
  @override
  _AdvanceCardState createState() => _AdvanceCardState();
}

class _AdvanceCardState extends State<AdvanceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: Container(
                  child: Text('01.'),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Text('Hussein\n Dunia'),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Text('kikombe\n juma'),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Text('Anayo'),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Text('950'),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Text('100,000'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
