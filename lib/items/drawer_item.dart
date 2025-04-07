import 'package:flutter/material.dart';
import 'package:news/firebase_manager/firebase_auth.dart';
import 'package:news/screens/logIn_screen.dart';

class DrawerItem extends StatelessWidget {
  final Function onTap;

  const DrawerItem({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
                child: Text(
              "News App",
              style: Theme.of(context).textTheme.titleLarge,
            )),
          ),
          InkWell(
            onTap: () {
              onTap();
            },
            child: ListTile(
              title: Text(
                "Go To Home",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: Icon(
                Icons.home_filled,
                color: Colors.white,
              ),
              subtitle: Text(
                "Click here",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            endIndent: 16,
            indent: 16,
          ),
          ListTile(
            onTap: () {
              FirebaseAuthentication.logOut();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            title: Text(
              "Log out",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            subtitle: Text(
              "Click here",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
