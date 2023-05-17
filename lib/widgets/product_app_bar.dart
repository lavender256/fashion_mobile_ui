import 'package:fashion_mobile_ui/data/color.dart';
import 'package:fashion_mobile_ui/model/product.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';

class ProductAppBar extends StatelessWidget {
  final Product product;

  ProductAppBar({this.product});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*.02),
        width: size.width,
        height: size.height*.15,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Iconsax.arrow_circle_left,
                  color: Colors.black,
                  size: size.width*.1,
                ),
                onPressed: ()=>Navigator.pop(context),
              ),
          Text(product.title,style: TextStyle(color: mainColor,fontWeight: FontWeight.w500,fontSize: size.width*.065),),
          IconButton(
            icon: Icon(
              Iconsax.bag,
              color: Colors.black,
            ),
            onPressed: null,
          )
        ]));
  }
}