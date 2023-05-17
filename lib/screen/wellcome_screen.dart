import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashion_mobile_ui/data/color.dart';
import 'package:fashion_mobile_ui/screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fashion_mobile_ui/data/data.dart';

class WellComeScreen extends StatefulWidget {
  @override
  State<WellComeScreen> createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(child: CarouselSlider.builder(itemCount: sliderList.length, itemBuilder: (BuildContext context,int index,int realIndex){
              return Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(sliderList[index]), fit: BoxFit.cover)),
              );
            }, options: CarouselOptions(
              height: size.height,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(milliseconds: 1000),
              onPageChanged: (index,reason){
                setState(() {
                  activeIndex=index;
                });
              }
            ))),
            Positioned(
              bottom: size.height * .03,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * .05),
                width: size.width * .9,
                height: size.height * .45,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("The Rag & Bone\nStore",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * .105)),
                    Text(
                        "Your appearance shoes your quality\nso give your best for best fashion",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * .045)),
                    Container(
                      width: size.width ,
                      height: size.height * .02,
                      child: Center(
                        child: AnimatedSmoothIndicator(count: sliderList.length,
                        effect: ScaleEffect(
                          activeDotColor: mainColor,
                          dotColor: Colors.white,
                          paintStyle: PaintingStyle.fill
                        ), activeIndex: activeIndex,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen())),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .03),
                        width: size.width * .8,
                        height: size.height * .07,
                        decoration: BoxDecoration(
                            color: mainColor.withOpacity(.9),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Swip to Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * .055),
                            ),
                            Container(
                              width: size.width * .16,
                              height: size.height * .05,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                child: Icon(
                                  Iconsax.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
