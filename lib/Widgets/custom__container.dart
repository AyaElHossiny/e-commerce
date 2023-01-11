import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({required this.text,
    Key? key,
  }) ;
String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[350],
      height: 8.h,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 15.sp,horizontal: 11.sp),
        child: Text(text,style: TextStyle(fontSize: 15.sp),),
      ),
    );
  }
}