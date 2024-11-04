
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/style/color_extensions/color_extensions.dart';
import '../Profile_Page/profile/profile_screen.dart';
import '../cart/cart_screen.dart';
import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';

class TabBArView extends StatefulWidget {
  final int selectedIndex;

  const TabBArView({super.key, this.selectedIndex = 0});

  @override
  State<TabBArView> createState() => _TabBArViewState();
}
class _TabBArViewState extends State<TabBArView> with SingleTickerProviderStateMixin {
  TabController? tabController;
  late int selectedTabIndex;

  @override
  void initState() {
    super.initState();
    selectedTabIndex = widget.selectedIndex;
    tabController = TabController(length: 5, vsync: this, initialIndex: selectedTabIndex);


    tabController!.addListener(() {
      setState(() {
        selectedTabIndex = tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomeScreen(tabController: tabController),
          const SearchScreen(),
          const CartScreen(),
          const FavoriteScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomAppBar(
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: TColor.primary,
            labelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: TColor.primaryText,
            unselectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
            tabs: [
              Tab(
                text: "Shop",
                icon: SvgPicture.asset(
                  "assets/icons/bottom_shop.svg",
                  color: selectedTabIndex == 0 ? TColor.primary : Colors.black,
                ),
              ),
              Tab(
                text: "Search",
                icon: SvgPicture.asset(
                  "assets/icons/bottom_search.svg",
                  color: selectedTabIndex == 1 ? TColor.primary : Colors.black,
                ),
              ),
              Tab(
                text: "Cart",
                icon: SvgPicture.asset(
                  "assets/icons/bottom_karzinka.svg",
                  color: selectedTabIndex == 2 ? TColor.primary : Colors.black,
                ),
              ),
              Tab(
                text: "Favorites",
                icon: SvgPicture.asset(
                  "assets/icons/bottom_like.svg",
                  color: selectedTabIndex == 3 ? TColor.primary : Colors.black,
                ),
              ),
              Tab(
                text: "Profile",
                icon: SvgPicture.asset(
                  "assets/icons/bottom_user.svg",
                  color: selectedTabIndex == 4 ? TColor.primary : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

