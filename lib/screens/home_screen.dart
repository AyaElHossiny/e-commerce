import 'package:e_commerce_app/Widgets/custom_card.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/search_screen.dart';
import 'package:e_commerce_app/services/get_all_products_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../models/product_model.dart';
class HomeScreen extends StatefulWidget {
 const  HomeScreen({Key? key}) : super(key: key);
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<ProductModel> productsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
       // elevation: 0,
        //shadowColor: Colors.black,
        leading:
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, CartScreen.id);
          },
          child: Icon(
            FontAwesomeIcons.cartShopping,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Products',
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: Icon(
               Icons.search,
                color: Colors.black,
                size: 20.sp,
              )),
          //Icon(Icons.shopping_cart,color: Colors.black,size: 20.sp,)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 50.sp,horizontal: 10.sp),
        child: FutureBuilder<List<ProductModel>>(
          //request
          future: AllProductsService().getAllProducts(),
          // snapshot
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //data usage
              List<ProductModel> products=snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3.sp,
                    crossAxisSpacing: 10.sp,
                    mainAxisSpacing: 50.sp,
                  ),
                  itemBuilder: (context,index){
                    return CustomCard(product: products[index],);
                  });
            }else{
             return const
             Center(child: CircularProgressIndicator());
            }
          }
        )
      ),
    );
  }
}



