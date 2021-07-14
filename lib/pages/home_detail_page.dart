import 'package:catalog_app/matterial/catalog.dart';
import 'package:catalog_app/widget/home_widget/add_to_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;

  const HomeDetail({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
            ],
          ),
        
          backgroundColor: context.theme.cardColor,
          bottomNavigationBar: Container(
            color: context.canvasColor,
            child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mV8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                 AddToCart(catalog: catalog).wh(150, 50)
                ]).p32(),
          ),
          body:SingleChildScrollView (
                      child: SafeArea(
                child: Column(
              children: [
                Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(
                      catalog.image,
                    )).h32(context),
                Expanded(
                    child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.canvasColor,
                    child: Column(
                      children: [
                        catalog.name.text.xl2.bold.make().p16(),
                        catalog.disc.text
                            .textStyle(context.captionStyle)
                            .xl
                            .center
                            .make(),
                        10.heightBox,
                        " Dolor dolor sit stet diam voluptua tempor ipsum dolor amet et. Takimata amet consetetur rebum nonumy justo labore, dolore sanctus consetetur magna sit. Dolor no stet invidunt lorem. Amet sanctus sit duo ut sit."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .py8(),
                        CartCounterState(),
                      ],
                    ).py16(),
                  ),
                ))
              ],
            )),
          )) ;
   
  }
}

class CartCounterState extends StatefulWidget {
  CartCounterState({Key key}) : super(key: key);

  @override
  _CartCounterStateState createState() => _CartCounterStateState();
}

class _CartCounterStateState extends State<CartCounterState> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 32,
        )
      ],
    );
  }
}
