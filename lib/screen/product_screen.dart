import 'package:dotted_border/dotted_border.dart';
import 'package:fashion_mobile_ui/data/color.dart';
import 'package:fashion_mobile_ui/data/data.dart';
import 'package:fashion_mobile_ui/model/product.dart';
import 'package:fashion_mobile_ui/widgets/product_app_bar.dart';
import 'package:fashion_mobile_ui/widgets/product_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';

class ProductScreen extends StatefulWidget {
final Product product;

ProductScreen({this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isLike=false;
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(width: size.width,
      height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ProductAppBar(product: widget.product,)),
            SliverToBoxAdapter(child: Container(width: size.width,
            height: size.height*.32,
              child: Stack(
                alignment: Alignment.center,
                children: [
                Positioned(
                    bottom: 0,
                    child: ClipPath(
                      clipper: ProductClipper(),
                      child: Container(width: size.width*.9,
                height: size.height*.25,
                      color: mainColor,
                ),
                    )),
                  Container(
                    width: size.width*.6,
                    height: size.height*.32,
                    decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        image: NetworkImage(redStyleSetList2[currentIndex])
                      )
                    ),
                  )
              ],),
            ),),
            SliverPadding(padding: EdgeInsets.symmetric(horizontal: size.width*.03,vertical: size.height*.02),
              sliver: SliverToBoxAdapter(
                child: Container(width: size.width,
                  height: size.width*.3,
                  child: ListView.builder(itemCount: redStyleSetList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(BuildContext context,int index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              currentIndex=index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: size.width*.025),
                            width: size.width*.29,
                            decoration: BoxDecoration(color: Colors.black,
                                image: DecorationImage(
                                    image: NetworkImage(redStyleSetList[index]),fit: BoxFit.cover
                                ),
                                border: Border.all(color: currentIndex==index?mainColor:Colors.transparent,width: 4),
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                        );

                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(child: Container(padding: EdgeInsets.symmetric(horizontal: size.width*.05),
              width: size.width,
              height: size.height*.1,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Red Style Set",style: TextStyle(color: Colors.black,fontSize: size.width*.07,fontWeight: FontWeight.w700),),
                    Text("125.000",style: TextStyle(color: Colors.black,fontSize: size.width*.05,fontWeight: FontWeight.w500),),
                  ],),
                  Container(
                    width: size.width*.15,
                    height: size.width*.15,
                    decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isLike?mainColor:Colors.white,
                    border: Border.all(color: isLike?Colors.white:mainColor)
                  ),
                    child: Center(
                      child: IconButton(icon: Icon(isLike?Iconsax.heart:Iconsax.heart5,color: isLike?Colors.white:mainColor,size: size.width*.08,), onPressed: (){
                        setState(() {
                          isLike=!isLike;
                        });
                      }),
                    ),
                  )
                ],
              ),
            ),),
            SliverToBoxAdapter(child: Container(padding: EdgeInsets.symmetric(horizontal: size.width*.05),
              width: size.width,
              height: size.height*.1,
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DottedBorder(
                    color: mainColor,
                    strokeWidth: 3,
                    gap:5,
                    child: Container(
                      width: size.width*.35,
                      height: size.height*.05,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Color",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
                        Container(width: size.width*.15,
                        decoration: BoxDecoration(color: mainColor,
                          borderRadius: BorderRadius.circular(15)
                        ),
                          child: IconButton(icon: Icon(FrinoIcons.f_arrow_down,color: Colors.white,),onPressed: null,),
                        )
                      ],
                      ),
                    ),
                  ),DottedBorder(
                    color: mainColor,
                    strokeWidth: 3,
                    gap:5,
                    child: Container(
                      width: size.width*.35,
                      height: size.height*.05,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Size",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
                          Container(width: size.width*.15,
                            decoration: BoxDecoration(color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Center(child: Text("XL",style: TextStyle(color: Colors.black),))
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),),
            SliverPadding(
              padding: EdgeInsets.only(left: size.width*.05,right: size.width*.05,top: size.height*.06),
              sliver: SliverToBoxAdapter(
                child: Container(width: size.width,
                height: size.height*.07,
                  decoration: BoxDecoration(color: mainColor,borderRadius: BorderRadius.circular(25)),
                  child: Center(child: Text("Add To Card".toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: size.width*.07),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
