import 'package:flutter/material.dart';
class SideNav extends StatelessWidget {

  final int selectedIndex;
  final Function setIndex;

  SideNav(this.selectedIndex, this.setIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          DrawerHeader(
              decoration: BoxDecoration(

                  image: DecorationImage(
                    scale:0.3,
                    image: ExactAssetImage("assets/images/logo.png"),
                    fit:BoxFit.fill,
                  )
              ),
              child: null
          ),

          //Divider(color: Colors.grey.shade400,),

          _navItem(context, Icons.add_alert, 'Prediction',
              onTap: () {_navItemClicked(context, 0);},
              selected: selectedIndex==0
          ),

          //Divider(color: Colors.grey.shade400,),

          _navItem(context, Icons.apps, 'Services',
              onTap: () {_navItemClicked(context, 1);},
              selected: selectedIndex==1
          ),
          _navItem(context, Icons.app_settings_alt_rounded, 'Disclaimer',
              onTap: () {_navItemClicked(context, 2);},
              selected: selectedIndex==2
          ),
          _navItem(context, Icons.article_outlined, 'Acceptable Use of Policy',
              onTap: () {_navItemClicked(context, 3);},
              selected: selectedIndex==3
          ),
          _navItem(context, Icons.assignment_outlined, 'Terms and Conditions',
              onTap: () {_navItemClicked(context, 4);},
              selected: selectedIndex==4
          ),
          _navItem(context, Icons.lock, 'Privacy Policy',
              onTap: () {_navItemClicked(context, 5);},
              selected: selectedIndex==5
          ),
          _navItem(context, Icons.perm_phone_msg_rounded, 'Contact Us',
              onTap: () {_navItemClicked(context, 6);},
              selected: selectedIndex==6
          ),
          _navItem(context, Icons.person_outline, 'My Profile',
              onTap: () {_navItemClicked(context, 7);},
              selected: selectedIndex==7
          ),
          //Divider(color: Colors.grey.shade400,),

          /*_navItem(context, Icons.logout, 'Log Out',
              onTap: () {_navItemClicked(context, 2);},
              selected: selectedIndex==2
          ),*/
        ],
      ),
    );
  }

  _navItem(BuildContext context, IconData icon, String text, {Text? suffix, Function? onTap, bool selected = false}) => Container(
    color: selected ? Colors.grey.shade300 : Colors.transparent,
    child: ListTile(
      leading: Icon(icon, color: selected ? Theme.of(context).primaryColor : Colors.black),
      trailing: suffix,
      title: Text(text, style: TextStyle(fontSize: 17)),
      selected: selected,
      onTap: () => {onTap!()},
    ),
  );

  _navItemClicked(BuildContext context, int index) {
    setIndex(index);
    Navigator.of(context).pop();
  }
}
