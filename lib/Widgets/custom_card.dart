import 'package:e_commerce_app/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../models/product_model.dart';
import '../providers/cart.dart';
class CustomCard extends StatelessWidget {
   CustomCard({required this.product,
    Key? key,
  }) : super(key: key);
 ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetail.id,arguments: product );
      },
      child: Stack(
        clipBehavior:Clip.none ,
        children: [
          Card(
            shadowColor: Colors.grey[100],
            elevation: 8.sp,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey, fontSize: 10.sp),
                  ),
                  // SizedBox(
                  //   height: 5.sp,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       r'$'' ${product.price.toString()}',
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                     GestureDetector(
                         onTap: (){
                           cart.addItem(product.id, product.price, product.title,
                               product.image);
                           ScaffoldMessenger.of(context).hideCurrentSnackBar();
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               content:const Text(
                                 'Added item to cart!',
                               ),
                               duration:const Duration(seconds: 2),
                               action: SnackBarAction(
                                 label: 'UNDO',
                                 onPressed: () {
                                   cart.removeSingleItem(product.id);
                                 },
                               ),
                             ),
                           );


                         },
                         child: const Icon(Icons.add_shopping_cart_outlined))
                     // IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))

                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            right: 16.sp,
            bottom: 50.sp,
            child: Image.network(product.image,
              height: 12.h,width: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}