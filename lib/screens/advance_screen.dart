import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero/add_card_button.dart';
import 'package:hero/animated_popup_card.dart';
import 'package:hero/custom_rect_tween.dart';
import 'package:hero/hero_dialog_route.dart';

import '/components/custom_appbar.dart';
import '/components/side_navbar.dart';

class AdvanceScreen extends StatefulWidget {
  @override
  _AdvanceScreenState createState() => _AdvanceScreenState();
}

class _AdvanceScreenState extends State<AdvanceScreen> {
  final _firestore = FirebaseFirestore.instance;

  setStateCallback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideNavBar(),
      appBar: customAppBar(context),
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            int sensitivity = 2;
            if (details.delta.dx > sensitivity) {
              return SideNavBar();
            }

            if (details.delta.dy < sensitivity) {
              setState(() {});
            }
          },
          child: Stack(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
                        child: Center(
                          child: Text(
                            'ADVANCE',
                            style: TextStyle(
                                fontSize: 36, color: Colors.teal.shade900),
                          ),
                        ),
                      ),
                      Divider(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                          'Date',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          'Seller',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          'Buyer',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          'Status',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          'Price',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          'Amount',
                                          style: TextStyle(fontSize: 18),
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
                      Column(
                        children: [
                          StreamBuilder(
                              stream: _firestore
                                  .collection('advance')
                                  .orderBy('createdAt', descending: false)
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                        ),
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return SizedBox(
                                  height: 520,
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    children: snapshot.data.docs.map((doc) {
                                      return GestureDetector(
                                        child: Hero(
                                          tag: 'editidInterfaceHero',
                                          createRectTween: (begin, end) {
                                            return CustomRectTween(
                                                begin: begin, end: end);
                                          },
                                          child: Card(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Center(
                                                      child: Container(
                                                        child: Text(
                                                            '${doc['date']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        child: Text(
                                                            '${doc['seller']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        child: Text(
                                                            '${doc['buyer']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        child: Text(
                                                            '${doc['status']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        child: Text(
                                                            '${doc['price']}'),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Container(
                                                        child: Text(
                                                            '${doc['amount']}'),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).push(
                                              HeroDialogRoute(
                                                  builder: (context) {
                                            return EditInterfacePopupCard();
                                          }));
                                        },
                                      );
                                    }).toList(),
                                  ),
                                );
                              }),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: AddCardButton(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheets(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (newValue) {
//                      name = newValue;
                    },
                  ),
                  TextField(
                    onChanged: (newValue) {
//                      name = newValue;
                    },
                  ),
                  TextField(
                    onChanged: (newValue) {
//                      name = newValue;
                    },
                  ),
                  TextField(
                    onChanged: (newValue) {
//                      name = newValue;
                    },
                  ),
                  TextField(
                    onChanged: (newValue) {
//                      name = newValue;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
//                        addBodyElement();
                        Navigator.pop(context);
                      });
                    },
                    child: Text('add'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
