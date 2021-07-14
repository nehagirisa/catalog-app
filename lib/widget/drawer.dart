import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Neha"),
              accountEmail: Text("nehagirisa5@gmail.com"),  
              currentAccountPicture: CircleAvatar(
                
                backgroundImage: AssetImage ('images/profile.jpg'), 
              ),
            ),
        ),
        ListTile(
              leading: Icon(CupertinoIcons. person_badge_plus,
               color: context.accentColor),
               title:
             Text ( "LogIn",
             textScaleFactor: 1.2,
             style: TextStyle(color: 
             context.accentColor),

             )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,
               color: context.accentColor),
               title:
             Text ( "Home",
             textScaleFactor: 1.2,
             style: TextStyle(color:context.accentColor),

             )
            ),
        
             ListTile(
              leading: Icon(CupertinoIcons.mail,
               color: context.accentColor),
               title:
             Text ( "Email me",
             textScaleFactor: 1.2,
             style: TextStyle(color: context.accentColor),

             )
            ),
             ListTile(
              leading: Icon(CupertinoIcons.person_circle_fill,
               color: context.accentColor),
               title:
             Text ( "Profile",
             textScaleFactor: 1.2,
             style: TextStyle(color:context.accentColor),

             )
            ),
             
        
      ]),
    );
  }
}
