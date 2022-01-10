import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hero/components/animated_search_bar.dart';
import 'package:hero/components/custom_appbar.dart';
import 'package:hero/components/side_navbar.dart';
import 'package:hero/components/stocks_popup_card.dart';

import '../hero_dialog_route.dart';

class StockScreen extends StatefulWidget {
  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      drawer: SideNavBar(),
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder(
                stream: _firestore
                    .collection('stocks')
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
                            children: snapshot.data.docs.map((doc) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  '${doc['customer']}',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  '${doc['date']}',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Center(
                                                child: Text(
                                                  '${doc['gunia']}',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Icon(Icons.more_vert),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Divider(
                                              color: Colors.black54,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text('Nauli'),
                                                  ),
                                                  Container(
                                                    child:
                                                        Text('${doc['nauli']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text('Tumizi'),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        '${doc['tumizi']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text('Deni'),
                                                  ),
                                                  Container(
                                                    child:
                                                        Text('${doc['deni']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text('Kago'),
                                                  ),
                                                  Container(
                                                    child:
                                                        Text('${doc['kago']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text('Changanya'),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        '${doc['changanya']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    child: Text('Machine'),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                        '${doc['machine']}'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 63,
                      ),
                    ],
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return StocksPopupCard();
          }));
        },
        icon: Icon(Icons.add),
        label: Text('Add Stock'),
      ),
    );
  }
}
