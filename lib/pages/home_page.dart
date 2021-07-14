
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/matterial/cart.dart';
import 'package:catalog_app/utills/routes.dart';
import 'package:catalog_app/widget/home_widget/catalog_header.dart';
import 'package:catalog_app/widget/home_widget/catalog_list.dart';
import 'package:catalog_app/widget/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/matterial/catalog.dart';
import 'package:catalog_app/widget/drawer.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/file/product.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    print(productsData);

    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
    setState(() {});
    print(CatalogModel.items[0].name);
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: context.cardColor,
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(CupertinoIcons.cart)
      //             .iconColor(context.theme.accentColor)),
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(CupertinoIcons.search)
      //             .iconColor(context.theme.accentColor)),
      //   ],
      // ),
      backgroundColor: context.cardColor,
      floatingActionButton: VxBuilder(
              mutations:{AddMutation,RemoveMutation} ,
              builder:(context,_, Store) => FloatingActionButton(
            backgroundColor: MyTheme.lightColor,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            )).badge(size:20,color:Colors.purple.shade200,count:_cart.items.length),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py8().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
