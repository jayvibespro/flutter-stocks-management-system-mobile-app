import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_rect_tween.dart';

String dropdownValue = 'Ofice';
String fixedDateHint = 'Pick Date';
String dateHint = 'Pick Date';

DateTime currentDate = DateTime.now();
DateFormat formatter = DateFormat('dd/MM');
String formatted = formatter.format(currentDate);

String seller;
String buyer;
String status;
String price;
String amount;

class AdvancePopupCard extends StatefulWidget {
  @override
  _AdvancePopupCardState createState() => _AdvancePopupCardState();
}

class _AdvancePopupCardState extends State<AdvancePopupCard> {
  @override
  Widget build(BuildContext context) {
    return MyPopupCard();
  }
}

class MyPopupCard extends StatefulWidget {
  @override
  _MyPopupCardState createState() => _MyPopupCardState();
}

class _MyPopupCardState extends State<MyPopupCard> {
  final dateController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Hero(
          tag: 'popUpAnime',
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'New Record',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                              decoration: InputDecoration(
                                hintText: 'Seller',
                              ),
                              cursorHeight: 30.0,
                              onChanged: (newValue) {
                                setState(() {
                                  seller = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                              cursorHeight: 30.0,
                              decoration: InputDecoration(
                                hintText: 'Buyer',
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  buyer = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              cursorHeight: 30.0,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Price',
                              ),
                              style: TextStyle(fontSize: 18),
                              onChanged: (newValue) {
                                setState(() {
                                  price = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: TextField(
                              textAlign: TextAlign.center,
                              cursorHeight: 30.0,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Amount',
                              ),
                              style: TextStyle(fontSize: 18),
                              onChanged: (newValue) {
                                setState(() {
                                  amount = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black54,
                              ),
                              elevation: 2,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                              ),
                              underline: Container(
                                height: null,
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                  status = newValue;
                                });
                              },
                              items: <String>[
                                'Ofice',
                                'Anayo',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: TextField(
                              readOnly: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                              cursorHeight: 30.0,
                              controller: dateController,
                              decoration: InputDecoration(hintText: dateHint),
                              onTap: () async {
                                await _selectDate(context);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            dateHint = fixedDateHint;
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            CircularProgressIndicator();
                            await _firestore.collection('advance').add({
                              'date': formatted,
                              'seller': seller,
                              'buyer': buyer,
                              'status': status,
                              'price': price,
                              'amount': amount,
                              'createdAt': currentDate
                            });
                            Navigator.pop(context);

                            dateHint = fixedDateHint;
                          },
                          child: Text(
                            'Add Customer',
                            style: TextStyle(color: Colors.teal, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditInterfacePopupCard extends StatefulWidget {
  @override
  _EditInterfacePopupCardState createState() => _EditInterfacePopupCardState();
}

class _EditInterfacePopupCardState extends State<EditInterfacePopupCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Hero(
          tag: 'editidInterfaceHero',
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Edit this transaction',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 0.2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.black54,
                      thickness: 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.teal, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
