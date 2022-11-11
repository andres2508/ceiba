import 'package:ceiba/model/user/users.model.dart';
import 'package:ceiba/ui/styles/color.styles.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User _user;
  const UserTile(this._user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all( Radius.circular( 5 ) ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 1
          )
        ]
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only( bottom: 5 ),
            child: Text( this._user.name,
              style: const TextStyle(
                fontSize: 18,
                color: ColorStyles.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Icon( Icons.phone, color: ColorStyles.accentColor, ),
              Padding(
                padding: const EdgeInsets.only( left: 10 ),
                child: Text( this._user.phone ),
              )
            ],
          ),
          Row(
            children: [
              Icon( Icons.mail, color: ColorStyles.accentColor, ),
              Padding(
                padding: const EdgeInsets.only( left: 10 ),
                child: Text( this._user.email ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){},
              child: Text('VER PUBLICACIONES')
            ),
          )
        ],
      ),
    );
  }
}
