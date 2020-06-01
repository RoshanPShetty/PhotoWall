import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:photowall/data/data.dart';
import 'package:photowall/model/categories_model.dart';
import 'package:photowall/model/wallpaper_model.dart';
import 'package:photowall/views/category.dart';
import 'package:photowall/views/search.dart';
import 'package:photowall/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CatergoriesModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getPopularWallpapers() async {
    var response = await http.get(
        "https://api.pexels.com/v1/curated?per_page=50",
        headers: {"Authorization": apiKey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });

    setState(() {});
  }

  @override
  void initState() {
    getPopularWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: brandName(),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(40),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "search", border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchQuery: searchController.text,
                                    )));
                      },
                      child: Container(child: Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
              Text(''),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      title: categories[index].categoryName,
                      imageUrl: categories[index].imageUrl,
                    );
                  },
                ),
              ),
              Text('Popular Photos', textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pacifico",
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
              ),
              SizedBox(height: 16,),
              wallpaperList(wallpapers, context),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String imageUrl, title;
  CategoryTile({@required this.title, @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Category(
          categoryName: title.toLowerCase(),
        )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  width: 400,
                  fit: BoxFit.cover,
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 300,
              width: 400,
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    fontFamily: "Pacifico",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
