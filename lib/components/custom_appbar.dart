import 'package:flutter/material.dart';
import 'package:hero/screens/search_screen.dart';

import '/screens/splash_screen.dart';

customAppBar(context) {
  return AppBar(
    title: Text('wonder Company'),
    actions: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 18, 0),
              child: GestureDetector(
                child: Center(
                  child: Icon(Icons.search),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => SearchPage()));
                },
              ),
            ),
            Container(
              child: GestureDetector(
                child: Center(
                  child: Icon(Icons.logout),
                ),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                },
              ),
            ),
          ],
        ),
      )
    ],
  );
}
