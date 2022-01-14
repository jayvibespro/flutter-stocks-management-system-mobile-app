import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hero/components/animated_search_bar.dart';
import 'package:hero/components/custom_appbar.dart';
import 'package:vibration/vibration.dart';

import '/components/side_navbar.dart';
import '../animated_popup_card.dart';
import '../hero_dialog_route.dart';

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
              StreamBuilder(
                stream: _firestore
                    .collection('advance')
                    .orderBy('createdAt', descending: false)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          AnimatedSearchBar(),
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
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
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
                                      SizedBox(
                                        width: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: snapshot.data.docs.map((doc) {
                              return GestureDetector(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Center(
                                            child: Container(
                                              child: Text('${doc['date']}'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              child: Text('${doc['seller']}'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              child: Text('${doc['buyer']}'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              child: Text('${doc['status']}'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              child: Text('${doc['price']}'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              child: Text('${doc['amount']}'),
                                            ),
                                          ),
                                        ),
//                                        Container(
//                                          child: Center(
//                                            child: GestureDetector(
//                                              child: Icon(Icons.more_vert),
//                                              onTap: () {
//                                                Navigator.of(context).push(
//                                                    HeroDialogRoute(
//                                                        builder: (context) {
//                                                  return EditInterfacePopupCard();
//                                                }));
//                                              },
//                                            ),
//                                          ),
//                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onLongPress: () async {
                                  Navigator.of(context)
                                      .push(HeroDialogRoute(builder: (context) {
                                    return EditInterfacePopupCard();
                                  }));
                                  if (await Vibration.hasVibrator()) {
                                    Vibration.vibrate(duration: 100);
                                  }
                                },
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return AdvancePopupCard();
          }));
        },
        icon: Icon(Icons.add),
        label: Text('Add Advance'),
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
