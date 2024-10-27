import 'package:flutter/material.dart';

import 'details/about_sceen.dart';
import 'details/delivrey_address_screen.dart';
import 'details/help_screen.dart';
import 'details/my_details_screen.dart';
import 'details/notifecations_screen.dart';
import 'details/orders_screen.dart';
import 'details/payment_methods_screen.dart';
import 'details/promo_cord_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(26),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Afsar Hossen    ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 14,
                            width: 14,
                            child: Image.asset(
                              "assets/icons/profile_ruchka.png",
                              // fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Imshuvo97@gmail.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_box.png",
              name: "Orders",
              tapPath: OrdersDetailsScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_my_details.png",
              name: "My Details",
              tapPath: MyDetailsScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_delivery_address.png",
              name: "Delivrey Address",
              tapPath: DelivreyAddressScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_payment_methods.png",
              name: "Payment Methods",
              tapPath: PaymentMethodsScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_promo_cord.png",
              name: "Promo Cord",
              tapPath: PromoCordScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_notifecations.png",
              name: "Notifecations",
              tapPath: NotifecationsScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_help.png",
              name: "Help",
              tapPath:HelpScreen(),
            ),
            const MyDivider(),
            const ListTilee(
              icon: "assets/icons/profile_about.png",
              name: "About",
              tapPath: AboutSceen(),
            ),
            const MyDivider(),
            const Spacer(),
            Container(
              // alignment: Alignment.centerLeft,
              height: 67,
              width: 364,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: Image.asset("assets/icons/profile_log_out.png"),
                    ),
                    const SizedBox(width: 110),
                    const Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF53B175),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ListTilee extends StatelessWidget {
  final String icon;
  final String name;
  final tapPath;

  const ListTilee({
    super.key,
    required this.icon,
    required this.name,
    required this.tapPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.titleHeight,
      leading: SizedBox(
        width: 20,
        height: 22,
        child: Image.asset(icon),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.navigate_next_rounded,
        size: 35,
        color: Colors.black,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => tapPath,
          ),
        );
      },
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 5,
      color: Colors.grey.shade400,
    );
  }
}
