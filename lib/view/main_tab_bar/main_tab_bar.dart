import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries/common/style/color_extensions/color_extensions.dart';
import 'package:groceries/view/home/home_screen.dart';

class TabBArView extends StatefulWidget {
  const TabBArView({super.key});

  @override
  State<TabBArView> createState() => _TabBArViewState();
}

class _TabBArViewState extends State<TabBArView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);

    tabController?.addListener(() {
      selectedTabIndex = tabController?.index ?? 0;
      setState(() {});
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
        controller: tabController,
        children: [
          const HomeScreen(),
          Container(),
          Container(),
          Container(),
          Container(),
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
            indicatorWeight: 1,
            labelColor: TColor.primary,
            labelStyle: TextStyle(
              color: TColor.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: TColor.primaryText,
            unselectedLabelStyle: TextStyle(
              color: TColor.primaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            labelPadding: const EdgeInsets.symmetric(horizontal: 2,vertical: 3),
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
