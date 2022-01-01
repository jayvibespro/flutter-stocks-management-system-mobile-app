import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String dropdownValue = 'Ofice';

class PopupCard extends StatefulWidget {
  @override
  _PopupCardState createState() => _PopupCardState();
}

class _PopupCardState extends State<PopupCard> {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Text(
                'Add new customer',
                style: TextStyle(fontSize: 18),
              ),
              Divider(
                color: Colors.teal.shade500,
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
                cursorHeight: 30.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorHeight: 30.0,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.teal,
                ),
                elevation: 8,
                style: const TextStyle(
                  color: Colors.teal,
                ),
                underline: Container(
                  height: null,
                ),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
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
              TextField(
                textAlign: TextAlign.center,
                cursorHeight: 30.0,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Add Customer',
                  style: TextStyle(color: Colors.teal, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
