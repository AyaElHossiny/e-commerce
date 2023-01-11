import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/cart.dart';
import 'cart_screen.dart';
class ProductDetail extends StatefulWidget {
 const  ProductDetail({Key? key}) : super(key: key);
  static String id = 'ProductDetail';

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    ProductModel product =
    ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.grey[200],
      //elevation: 0,
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon:const Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
      title:const Text('Product Detail',style: TextStyle(color: Colors.black),),
      centerTitle: true,
    ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 20.sp,vertical: 30.sp
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(product.image,
                height: 30.h,width: 50.w,
              ),
              SizedBox(height: 3.h,),
              Text(product.title,style: TextStyle(
                fontSize: 18.sp,fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 1.5.h,),
              Text(' ${product.price.toString()}'r'$',style: TextStyle(
                  fontSize: 20.sp,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 1.5.h,),
              Text(product.description
                  ,style: TextStyle(
                  fontSize: 15.sp,
                color: Colors.grey[600]
              )),
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton.extended(
        onPressed: () {
          cart.addItem(product.id, product.price, product.title,
              product.image);
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'Added item to cart!',
              ),
              duration: const Duration(seconds: 2),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  cart.removeSingleItem(product.id);
                },
              ),
            ),
          );
            Navigator.pushNamed(context, CartScreen.id);
            },
        label: const Text('Add to cart'),
        icon: const Icon(Icons.add_shopping_cart_outlined),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
