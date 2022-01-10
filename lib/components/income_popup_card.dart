import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime currentDate = DateTime.now();
DateFormat formatter = DateFormat('dd/MM/yyyy');
String formatted = formatter.format(currentDate);
String dateHint = 'Pick Date';
String fixedDateHint = 'Pick Date';

String name;
String description;
String date;
String amount;

class IncomePopupCard extends StatefulWidget {
  @override
  _IncomePopupCardState createState() => _IncomePopupCardState();
}

class _IncomePopupCardState extends State<IncomePopupCard> {
  final dateController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

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
        child: Material(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: isLoading
              ? Container(
                  padding: EdgeInsets.all(16.0),
                  height: 280,
                  width: double.infinity,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Please wait...'),
                    ],
                  )),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'New Income',
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                        ),
                        const Divider(
                          thickness: 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',
                                  ),
                                  cursorHeight: 30.0,
                                  onChanged: (newValue) {
                                    setState(() {
                                      name = newValue;
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
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    hintText: 'Amount',
                                  ),
                                  cursorHeight: 30.0,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    hintText: 'Description',
                                  ),
                                  cursorHeight: 30.0,
                                  onChanged: (newValue) {
                                    setState(() {
                                      description = newValue;
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
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextField(
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                    cursorHeight: 30.0,
                                    controller: dateController,
                                    decoration:
                                        InputDecoration(hintText: dateHint),
                                    onTap: () async {
                                      await _selectDate(context);
                                    },
                                  ),
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
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                  dateHint = fixedDateHint;
                                });
                                await _firestore.collection('income').add({
                                  'date': formatted,
                                  'name': name,
                                  'description': description,
                                  'amount': amount,
                                  'createdAt': FieldValue.serverTimestamp()
                                });

                                await Future.delayed(Duration(seconds: 2));
                                Navigator.pop(context);
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Text(
                                'Save',
                                style:
                                    TextStyle(color: Colors.teal, fontSize: 18),
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
    );
  }
}
