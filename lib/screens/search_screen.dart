import 'package:e_commerce_app/Widgets/custom_card.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/services/get_all_products_service.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static String id = 'SearchPage';


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? searchText;
  List<ProductModel>? searchedList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.close,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchText = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    //fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            ),
            SizedBox(height:6.h),
            FutureBuilder<List<ProductModel>>(
              future: AllProductsService().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;
                  searchedList = searchText == null
                      ? snapshot.data!
                      : products
                      .where((c) =>
                      c.title.toLowerCase().contains(searchText!))
                      .toList();
                  return searchText == null
                      ? const Center(
                    child: Text('search for a product'),
                  )
                      : Expanded(
                    child: ListView.builder(
                      clipBehavior:Clip.none,
                      itemCount: searchedList!.length,
                      itemBuilder: (context, index) =>
                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 40.sp,horizontal: 20.sp),
                            child: CustomCard(
                              product: searchedList![index],
                            ),
                          ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}