import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/components/custom_appbar.dart';
import '/components/popup_card.dart';
import '/components/side_navbar.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavBar(),
      appBar: customAppBar(context),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(1, 16, 1, 4),
                      child: Text(
                        'INCOME:',
                        style: TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(1, 16, 1, 4),
                      child: Text(
                        'Tsh 21,780,000/=',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.teal,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Center(
                          child: Container(
                            child: Text(
                              'SN',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Date',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Name',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Description',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text(
                              'Amount',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Divider(
                color: Colors.teal,
              ),
              Card(
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
                            child: Text('07/12/2021'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'kikombe Jumanne',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Nauli ya mizigo',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                '12,000',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Center(
                          child: Container(
                            child: Text('02.'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Text('21/12/2021'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Shija Mbawala',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'luku',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                '200,000',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context, builder: (BuildContext context) => PopupCard());
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
