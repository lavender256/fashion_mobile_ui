import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:fashion_mobile_ui/model/product.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({this.product});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: NetworkImage(product.imageUrl)),
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned(
                top: size.height * .01,
                right: size.height * .01,
                child: BlurryContainer(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  blur: 15,
                  child: Container(
                    width: size.width * .13,
                    height: size.height * .02,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "16%off",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),
            Positioned(
                bottom: size.height * .1,
                right: size.height * .02,
                child: BlurryContainer(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.transparent,
                  blur: 15,
                  child: Container(
                    width: size.width * .07,
                    height: size.width * .07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Icon(
                      FrinoIcons.f_heart,size: size.width*.05,
                      color: Colors.white,
                    )),
                  ),
                )),
            Positioned(
                bottom: 0,right: 0,left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width*.05,
                  vertical: size.height*.02
                  ),
                  color: Colors.white,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(product.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),),
                  Text(
                   '\$${product.price}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
