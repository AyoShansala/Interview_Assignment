import 'package:assignment_1/model/category.dart';
import 'package:assignment_1/providers/category_provider.dart';
import 'package:assignment_1/screens/detail_screen.dart';
import 'package:assignment_1/widgets/button_widget.dart';
import 'package:assignment_1/widgets/category_item_widget.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<CategoryItem?>?> futureCategoryItem;
  CategoryProvider categoryProvider = CategoryProvider();
  @override
  void initState() {
    // TODO: implement initState
    futureCategoryItem = categoryProvider.fetchCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    int _selectedScreenIndex = 0;
    void _selectScreen(int index) {
      setState(() {
        _selectedScreenIndex = index;
      });
    }

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          const Icon(
            Icons.search,
          ),
          SizedBox(
            width: width * 0.05,
          ),
          const Icon(
            Icons.archive_outlined,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: const Color.fromRGBO(66, 99, 232, 1),
            ),
            label: 'Screen A',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.navigation,
              color: Colors.grey,
            ),
            label: "Screen B",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            label: "Screen c",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: "Screen D",
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Enjoy the world \ninto virtual reality",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.26,
              width: width * 0.9,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(66, 99, 232, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Improved Controller \nDesign With \nVirtual Reality",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    "Buy Now!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromRGBO(66, 99, 232, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          "assets/vr2.png",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const CustomButton(
                    btnName: "All Product",
                    btnColor: Color.fromRGBO(66, 99, 232, 1),
                    txtColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    btnName: "Popular",
                    btnColor: Colors.grey.shade400,
                    txtColor: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                    btnName: "Recent",
                    btnColor: Colors.grey.shade400,
                    txtColor: Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<CategoryItem?>?>(
                future: futureCategoryItem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CategoryItem?> catItem = snapshot.data ?? [];
                    //print("this is front end : ${catItem[3]!.price}");

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        //print(catItem![index]!.description);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => DetailsScreen(
                                  imageUrl: catItem[index]!.images,
                                  itemName: catItem[index]!.title,
                                  itemPrice: catItem[index]!.price,
                                  itemRatings: catItem[index]!.rating,
                                  itemDescription: catItem[index]!.description,
                                ),
                              ),
                            );
                          },
                          child: CategoryItems(
                            itemName: catItem[index]!.title,
                            itemUrl: catItem[index]!.images,
                            itemprice: catItem[index]!.price,
                          ),
                        );
                      },
                      separatorBuilder: (context, _) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: catItem.length,
                    );
                  } else if (snapshot.hasError) {
                    return const Text(
                      "Error while fetching category",
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: [
            //       CategoryItems(itemName: "dasdadsad"),
            //       CategoryItems(itemName: "dadadsad"),
            //       //CategoryItems(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
