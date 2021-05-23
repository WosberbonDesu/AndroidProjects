import 'package:audioplayer/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 20,),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavbarItem(
            icon: Icons.arrow_back_ios,
          ),
          Text(
            'Playing Now',
            style: TextStyle(
              fontSize: 16,
              color: darkPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          NavbarItem(
            icon: Icons.list,
          )
        ],
      ),
    );
  }
}


class NavbarItem extends StatelessWidget {

  final IconData icon;

  const NavbarItem({Key key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: darkPrimaryColor.withOpacity(0.5),
            offset: Offset(5,10),
            spreadRadius: 3,
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3,-4),
            spreadRadius: -2,
            blurRadius: 20,
          ),
        ],
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon,color: darkPrimaryColor,),
    );
  }
}

