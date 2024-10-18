import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/style/color_extensions/color_extensions.dart';

class DetailScreen extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String weight;
  final String description;
  final String price;

  const DetailScreen(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.weight,
      required this.description, required this.price});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.height * 0.43,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.grey.withOpacity(0.08),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SafeArea(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.back,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: media.height * 0.27,
                        width: media.width * 0.9,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                          // height: media.height * 0.3,
                          // width: media.width * 0.3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 37,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: media.width * 0.3,
                ),
                const Icon(
                  CupertinoIcons.heart,
                  size: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.weight,
                    style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/minus.png",
                      height: media.height * 0.055,
                      width: media.width * 0.055,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: media.height * 0.05,
                  width: media.width * 0.11,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xffE2E2E2),
                    ),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/plus.png",
                    height: media.height * 0.055,
                    width: media.width * 0.055,
                  ),
                ),
                const SizedBox(width: 200,),
                Text(
                  widget.price,
                  style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
