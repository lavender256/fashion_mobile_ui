import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height*.15,
        child: Row(children: [
          IconButton(
            icon: Icon(
              Iconsax.arrow_circle_left,
              color: Colors.black,
              size: size.width*.1,
            ),
            onPressed: null,
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              FrinoIcons.f_search,
              color: Colors.black,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Iconsax.scan,
              color: Colors.black,
            ),
            onPressed: null,
          )
        ]));
  }
}
