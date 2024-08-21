import 'package:flutter/material.dart';
import 'package:miniecommerceapp/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //drawer header
                DrawerHeader(
                    child: Center(
                  child: Icon(
                    Icons.trolley,
                    size: 70,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )),

                const SizedBox(height: 25),

                //shop tile
                MyListTile(
                    text: "Shop",
                    icon: Icons.shop,
                    onTap: () => Navigator.pop(context)),
                // cart tile
                MyListTile(
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/cart_page");
                    }),
                //settings tile
                MyListTile(
                    text: "Settings",
                    icon: Icons.settings,
                    onTap: () {
                      Navigator.pushNamed(context, "/settings_page");
                    }),
              ],
            ),

            //exit tile
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                  text: "Log out",
                  icon: Icons.logout,
                  onTap: () {
                    // navigate to intro page and clear stack of routes so you can't go back to previous page
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/intro_page", (route) => false);
                  }),
            )
          ],
        ));
  }
}
