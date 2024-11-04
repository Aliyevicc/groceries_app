import 'package:flutter/material.dart';

class GroceriesSection extends StatelessWidget {
  const GroceriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.height * 00.1,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: media.height * 2,
                    width: media.width * 0.6,
                    decoration: BoxDecoration(
                      color: const Color(0xffF8A44C).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 100,
                          width: 80,
                          child:
                              Image.asset("assets/images/home_beverages.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Drinks",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: media.height * 2,
                    width: media.width * 0.6,
                    decoration: BoxDecoration(
                      color: const Color(0xff53B175).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 100,
                          width: 80,
                          child:
                              Image.asset("assets/images/home_beverages.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Drinks",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
