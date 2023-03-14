import 'package:flutter/material.dart';
import 'package:chowdrop/utils/colors.dart';
import 'package:chowdrop/widgets/big_text.dart';
import 'package:chowdrop/home/chowdrop_page_body.dart';

class MainChowDropPage extends StatefulWidget {
  const MainChowDropPage({super.key});

  @override
  State<MainChowDropPage> createState() => _MainChowDropPageState();
}

class _MainChowDropPageState extends State<MainChowDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        //showing the header
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Lagos"),
                    Text("City"),
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search, color: Colors.white),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // showing the body
        ChowDropPageBody(),
      ]),
    );
  }
}
