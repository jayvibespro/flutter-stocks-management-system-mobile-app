import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/screens/advance_screen.dart';
import '/screens/all_customers_screen.dart';
import '/screens/expenses_screen.dart';
import '/screens/income_screen.dart';

class SideNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Wonder Store'),
            accountEmail: Text('wonderstore001@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/2.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.teal,
              image: DecorationImage(
                image: AssetImage('images/2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text('Balance:'),
            trailing: Text('Tsh 10,456,450/='),
          ),
          ListTile(
            leading: Icon(Icons.event_available),
            title: Text('Advance'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AdvanceScreen()));
            },
          ),
          ListTile(
              leading: Icon(Icons.people),
              title: Text('All Customers'),
              trailing: ClipOval(
                child: Container(
                  color: Colors.teal,
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Text(
                      '102',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AllUsersScreen()));
              }),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Expenses'),
            trailing: Text('Tsh 6,885,000/='),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ExpensesScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.paid),
            title: Text('Income'),
            trailing: Text('Tsh 12,809,000/='),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => IncomeScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.inventory),
            title: Text('Stock'),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '52',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Pumba'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => Navigator.pop(context),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.facebook,
                          color: Colors.teal.shade600,
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.event_available,
                          color: Colors.teal.shade600,
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.contact_mail,
                          color: Colors.teal.shade600,
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.email,
                          color: Colors.teal.shade600,
                        )),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Icon(
                          Icons.phone,
                          color: Colors.teal.shade600,
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
