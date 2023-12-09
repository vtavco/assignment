import 'package:flutter/material.dart';

bool isClick = false;

class PopularItemWidget extends StatefulWidget {
  @override
  State<PopularItemWidget> createState() => _PopularItemWidgetState();
}

class _PopularItemWidgetState extends State<PopularItemWidget> {
  List recommendedList = [
      ["assets/images/rimg1.jpg", "KD 100.00", false],
      ["assets/images/rimg2.jpg", "KD 120.00", false],
      ["assets/images/rimg3.jpg", "KD 99.00", false],
      ["assets/images/rimg4.jpg", "KD 99.00", false],
      ["assets/images/rimg5.jpg", "KD 200.00", false]
    ];
  @override
  Widget build(BuildContext context) {
    

    return SingleChildScrollView(
      
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            for (int i = 0; i < recommendedList.length; i++)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Container(
                  width: 170,
                  height: 325,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 251, 250, 250),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Container(
                              child: Image.asset(recommendedList[i][0]),
                            ),
                            SizedBox(height: 15),
                            const Text(
                              "Zara",
                              style: TextStyle(
                                  color: Color(0xFF633558),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Cloths for Men",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              recommendedList[i][1],
                              style: const TextStyle(
                                  color: Color(0xFF633558),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon((recommendedList[i][2] == false)
                            ? Icons.favorite_border_outlined
                            : Icons.favorite, color: Colors.grey,),
                        onPressed: () {
                          setState(() {
                            recommendedList[i][2] = !recommendedList[i][2];
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
