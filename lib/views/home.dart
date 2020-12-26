import 'package:feeder/helper/data.dart';
import 'package:feeder/models/category_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories=new List<CategoryModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flash'),
            Text('News',style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              height: 70.0,
              child: ListView.builder(
                  itemCount:categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}


class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
              child: Image.network(imageUrl, width: 120.0, height: 60.0,fit: BoxFit.cover,)
          ),
          Container(
            alignment: Alignment.center,
            width: 120.0, height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.black26,
            ),
            child: Text(
              categoryName,style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500
            ),
            ),
          )
        ],
      ),
    );
  }
}
