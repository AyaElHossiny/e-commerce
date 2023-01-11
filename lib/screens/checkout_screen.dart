import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Widgets/custom__container.dart';
import '../Widgets/custom_text_form_field.dart';
class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({Key? key}) : super(key: key);
  static String id = 'CheckoutScreen';
  String? address;
   bool cash =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        //elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:const Icon(Icons.clear,color: Colors.black,)),
        title:const Text(' Checkout',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.sp,vertical: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ADDRESS DETAILS',
              style: TextStyle(
                  fontSize: 13.sp,
                color: Colors.grey[600]
              ),),
            CustomTextFormField(
              onchanged: (data){
                address=data;
              },
            ),
            SizedBox(height: 8.h,),
            Text(' SELECT A PAYMENT METHOD',
              style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey[600]
              ),),
            CustomContainer(text: 'Pay by Card',),
            SizedBox(height: 2.h),
            CustomContainer(text: 'Cash On Delivery',)

          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () {
        },
        label: const Text('Save'),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

