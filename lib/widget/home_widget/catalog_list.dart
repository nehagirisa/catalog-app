import 'package:catalog_app/widget/home_widget/add_to_card.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


import 'package:catalog_app/matterial/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/widget/home_widget/catalog_image.dart';


class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            final catalog = CatalogModel.items[index];
            return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetail(catalog: catalog))),
                child: CatalogItem(catalog: catalog));
          }),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(children: [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: catalog.image,
        ).h64(context).p16().box.make(),
      ),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            catalog.name.text.lg.bold.make(),
            10.heightBox,
            ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mV8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog,)
                ]).pOnly(right: 7.0)
          ]))
    ])).color(context.canvasColor).roundedLg.square(130).make().p12();
  }
}


