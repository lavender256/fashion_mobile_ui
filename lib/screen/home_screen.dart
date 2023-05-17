import 'package:fashion_mobile_ui/data/color.dart';
import 'package:fashion_mobile_ui/data/data.dart';
import 'package:fashion_mobile_ui/model/product.dart';
import 'package:fashion_mobile_ui/screen/product_screen.dart';
import 'package:fashion_mobile_ui/widgets/my_app_bar.dart';
import 'package:fashion_mobile_ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * .05),
        width: size.width,
        height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: MyAppBar()),
            SliverPadding(
                padding: EdgeInsets.only(
                    top: size.height * .05, bottom: size.height * .05),
                sliver: SliverToBoxAdapter(
                    child: Row(children: [
                      Text(
                        "Product Catalog",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width * .07),
                      ),
                      SizedBox(width: size.width*.02,),
                      Icon(Iconsax.trend_up,color: mainColor,)
                    ],))),
             SliverPadding(
               padding: EdgeInsets.only(bottom: size.height*.1),
               sliver: SliverStaggeredGrid.countBuilder(
                  itemCount: productList.length,
                  staggeredTileBuilder: (int index)=>(index==0 ||  index==7)?StaggeredTile.count(1, 1.4):
                  StaggeredTile.count(1, 2.2),
                  mainAxisSpacing: size.height*.01,
                  crossAxisCount: 2,
                  crossAxisSpacing: size.width*.04, itemBuilder: (BuildContext context, int index) {
                 Product product=productList[index];
                  return Transform.translate(
                    offset: Offset(0,index.isOdd?50:0),
                    child: GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductScreen(product: product,))),
                        child: ProductCard(product: product,))
                  );
                },
                ),
             ),
          ],
        ),
      ),
    );
  }
}
/*;*/