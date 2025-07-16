import 'package:flutter/material.dart';
import '../providers/category.dart';
import '../screens/product_list_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var categoryDb = Category();
  var categoryList = [];
  Future loadCategoary() async {
    categoryDb.initiliase();
    categoryDb.getCategorywithImg().then((value) {
      // print(value);
      setState(() {
        categoryList = value;
      });
      // print(categoryList);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCategoary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: categoryList.length > 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductListScreen(
                                                  category: categoryList[index]
                                                      ["name"])));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .12,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .045,
                                                child: Image(
                                                  height: 15,
                                                  width: 28,
                                                  color: Colors.black54,
                                                  image: AssetImage(
                                                      "assets/images/icons8-jewelry-64.png"),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                categoryList[index]["name"],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Tap to Show Product",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 11),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      })))
          : Center(child: Text("No Category Found....")),
    );
  }
}
