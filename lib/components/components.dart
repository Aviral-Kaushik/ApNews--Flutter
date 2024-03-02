import 'package:flutter/material.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';

class Dividerwidget extends StatelessWidget {
  const Dividerwidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Divider(color: AppColors.lightwhite),
    );
  }
}

class BottomSheetImage extends StatelessWidget {
  final String imageurl, title;
  const BottomSheetImage({ Key? key,
  required this.imageurl, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(children: [
        Container(  
          foregroundDecoration: BoxDecoration(  
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)
            ),
            image: DecorationImage(  
              image: NetworkImage(imageurl), fit: BoxFit.contain
            )
          ),
        ),
        Positioned(
          bottom: 10,
          child: Container(  
            padding: EdgeInsets.all(10),
            width: 300,
            child: boldText(text: title, size: 18, color: Colors.white),
          ),
        )
      ],),
    );
  }
}