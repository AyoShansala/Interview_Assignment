import 'package:assignment_1/widgets/button_widget.dart';
import 'package:assignment_1/widgets/checkout_button.dart';
import 'package:assignment_1/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    super.key,
    required this.imageUrl,
    required this.itemName,
    required this.itemPrice,
    required this.itemRatings,
    required this.itemDescription,
  });
  String imageUrl;
  double itemRatings;
  String itemName;
  String itemPrice;
  String itemDescription;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.archive_outlined,
            ),
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(66, 99, 232, 1),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.itemName,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                          const Icon(
                            Icons.star_border,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Text(
                            "${widget.itemRatings} revievs",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Text(
                            "${widget.itemPrice}",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Text(
                              widget.itemDescription,
                              overflow: TextOverflow.clip,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIconDesign(
                            itemName: "Improved Optics",
                            itemIcon: Icons.remove_red_eye,
                          ),
                          CustomIconDesign(
                            itemName: "Clear Brightness",
                            itemIcon: Icons.brightness_1_sharp,
                          ),
                          CustomIconDesign(
                            itemName: "Wifi Controllers",
                            itemIcon: Icons.wifi,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CheckOutButton(
                        btnName: "Checkout",
                        btnColor: Colors.black,
                        txtColor: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
