import 'package:e_commerce_app/providers/cart.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/checkout_screen.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/product_detail_screen.dart';
import 'package:e_commerce_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
bool darkMode =false;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return ChangeNotifierProvider.value(
            value: Cart(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                HomeScreen.id: (context) => const HomeScreen(),
                ProductDetail.id:(context)=>const ProductDetail(),
                CartScreen.id:(context)=>const CartScreen(),
                CheckoutScreen.id:(context)=> CheckoutScreen(),
                SearchPage.id:(context)=>const SearchPage(),

              },
              initialRoute: HomeScreen.id,
            ),
          );
        }
    );

  }
}

