// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chowdrop/utils/colors.dart';
import 'package:chowdrop/widgets/icon_and_text_widget.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class ChowDropPageBody extends StatefulWidget {
  const ChowDropPageBody({Key? key}) : super(key: key);

  @override
  State<ChowDropPageBody> createState() => _ChowDropPageBodyState();
}

class _ChowDropPageBodyState extends State<ChowDropPageBody> {
  // items both left and right inset on viewport
  PageController pageController = PageController(viewportFraction: 0.85);
  // Scale box on scroll
  var _currPageValue = 0.0;
  // save the scaleFactor
  double _scaleFactor = 0.8;
  // save the height
  double _height = 220;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
        // print("Current value is $_currPageValue");
      });
    });
  }

  // Dispose after usage to avoid memory leak
  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.redAccent,
          height: 320,
          child: PageView.builder(
              itemCount: 5,
              itemBuilder: (context, position){
                return _buildPageItem(position);
              }),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
      // Dart code
      Matrix4 matrix = new Matrix4.identity();
      //statements = Current slide, Next slide, Previous slide (in that order)
      if(index == _currPageValue.floor()){
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        //reduce the height/y-factor on swipe
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      } else if (index == _currPageValue.floor()+1){
        var currScale = _scaleFactor*(_currPageValue-index+1)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      } else if (index == _currPageValue.floor()+1) {
        var currScale = _scaleFactor * (_currPageValue - index + 1) *
            (1 - _scaleFactor);
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currScale, 0);
      } else {
        var currScale = 0.8;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
      }

      //Wrap stack widget with transform widget for the statements above to work
      return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: 220,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF69c5df),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/voyage-human.png"
                )
              )
            ),
          ),
            // Align lets the container overlie one another
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0)
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0)
                    )
                  ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side"),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) => Icon(Icons.star, color:AppColors.mainColor, size: 15))
                        ),
                        SizedBox(width: 10),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10),
                        SmallText(text: "1287"),
                        SizedBox(width: 10),
                        SmallText(text: "comments"),
                      ]
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7Km",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.iconColor2)
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
    ),
      );
  }
}
