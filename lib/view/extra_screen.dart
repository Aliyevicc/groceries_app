import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Find products",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintText: "Search Store",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                        )
                      : null,
                ),
                onChanged: (text) {
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFF53B175).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFF53B175),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/vegatables.png'),
                        const Text(
                          "Frash Fruits \n&Vegatable",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFFF8A44C).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFFF8A44C),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        Image.asset('assets/images/cooking.png'),
                        const Text(
                          "Cooking oil\n    &Ghee",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFF7A593).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFFF7A593),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/meat.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Meat & Fish",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD3B0E0).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFFD3B0E0),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/bakery.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Bakery & Snacks",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFDE598).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFFFDE598),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/jalab.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Dairy & Eggs",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFFB7DFF5).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFFB7DFF5),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/last.png'),
                        const Text(
                          "Frash Fruits \n&Vegatable",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFF53B175).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFF53B175),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/vegatables.png'),
                        const Text(
                          "Frash Fruits \n&Vegatable",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 190,
                    width: 174,
                    decoration: BoxDecoration(
                        color: const Color(0xFF53B175).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(19),
                        border: Border.all(
                          color: const Color(0xFF53B175),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset('assets/images/vegatables.png'),
                        const Text(
                          "Frash Fruits \n&Vegatable",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
