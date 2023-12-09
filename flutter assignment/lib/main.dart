import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practice/PopularItemWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _RootPageState();
}

class _RootPageState extends State<MyApp> {
  int inBagCount = 0;
  bool click = false;
  bool _isExpanded = false;
  List imageList = [
    {"id": 1, "image_path": "assets/images/img1.jpg"},
    {"id": 2, "image_path": "assets/images/img2.jpg"},
    {"id": 3, "image_path": "assets/images/img3.jpg"},
    {"id": 4, "image_path": "assets/images/img4.jpg"},
    {"id": 4, "image_path": "assets/images/img5.jpg"},
  ];

  
  
  List<String> listColor = <String>[
    'Select color',
    'Black',
    'Red',
    'Orange',
    'Blue'
  ];
  List<String> listSize = <String>['Select size', 'XL', 'XXL', 'Medium', 'Big'];
  String dropdownValue1 = 'Select color';
  String dropdownValue2 = 'Select size';
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Badge(
                label: Text(inBagCount.toString()),
                child: Icon(Icons.shopping_bag_outlined),
              ),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(currentIndex);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 0.8,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 17 : 7,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentIndex == entry.key
                                  ? Colors.grey
                                  : const Color(0xFF633558),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(
                  "Zara",
                  style: TextStyle(
                      color: Color(0xFF633558),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Cloths for Men",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Text(
                      "KD 65.00",
                      style: TextStyle(
                          color: Color(0xFF633558),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "85.00",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 20,
                        width: 100,
                        child: DropdownButton<String>(
                          value: dropdownValue1,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue1 = value!;
                            });
                          },
                          items: listColor
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        height: 20,
                        width: 100,
                        child: DropdownButton<String>(
                          value: dropdownValue2,
                          icon: const Icon(Icons.arrow_drop_down),
                          isExpanded: true,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue2 = value!;
                            });
                          },
                          items: listSize
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 60,
                    child: OutlinedButton.icon(
                      icon: Icon(
                        (click == false)
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.grey,
                      ),
                      label: const Text('WISHLIST'),
                      onPressed: () {
                        setState(() {
                          click = !click;
                        });
                      },

                      // child: Text('wishlist'),

                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    height: 60,
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.share),
                      label: const Text('SHARE'),
                      onPressed: () {},

                      // child: Text('wishlist'),

                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0))),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 25),
              ExpansionTile(
                trailing: Icon(
                  _isExpanded ? Icons.remove : Icons.add,
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                title: Text('DESCRIPTION'),
                children: [
                  ListTile(
                    title: Text(
                        "Soft Touch Cotton Fabrics: Good capability of tenderness, air permeability and moisture absorption feels soft and comfy. Sleeve Type :- Full Sleeve , Occasion :- Casual, Closure :- Button"),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Divider(
                  thickness: 2.0,
                ),
              ),
              ExpansionTile(
                trailing: Icon(
                  _isExpanded ? Icons.remove : Icons.add,
                ),
                onExpansionChanged: (bool expanded) {
                  setState(() {
                    _isExpanded = expanded;
                  });
                },
                title: Text('COMPOSITION AND CARE'),
                children: [
                  ListTile(
                    title: Text(
                        "Shop from a wide range of Shirts from IndoPrimo. Perfect for your everyday use, festival you could pair it with a stylish pair of Jeans or Chinos to complete the look.100% High-grade Cotton Fabrics."),
                  )
                ],
              ),
              SizedBox(height: 25),
              const Text(
                "BLOCK49 ID:0324",
              ),
              SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: Text(
                  "MORE FROM ZARA",
                  style: TextStyle(
                      color: Color(0xFF633558),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PopularItemWidget(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        inBagCount += 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF633558),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text("ADD TO BAG"),
                  ),
                ),
              ),

              SizedBox(height: 11),
            ],
          ),
        ),
      ),
    );
  }
}
