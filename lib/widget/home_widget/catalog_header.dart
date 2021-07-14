//import 'package:catalog_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl3.bold.color(context.theme.accentColor).make(),
        "Teranding products".text.xl.make(),
        //Categories(),
      ],
    );
  }
}

// class Categories extends StatefulWidget {
//   Categories({Key key}) : super(key: key);

//   @override
//   _CategoiresState createState() => _CategoiresState();
// }

// class _CategoiresState extends State<Categories> {
//   List<String> catagories = ["Hair Oil", "Shampoo", "Body Wash", "Face wash"];
//   int selectedIndex = 0;

//   get categories => null;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 25,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: CatalogModel.items.length,
//           itemBuilder: (context, index) => buildcategories(index),
//         ));
//   }

//   Widget buildcategories(int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//         Text(
//           categories[index],
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black26),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 0.0/4),
//         height: 2,
//         width:30 ,
//         color: Colors.black,
//         ),
//       ]),
//     );
//   }
// }
