import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Icon(Icons.account_circle,
                  size: 48,
                  color: Colors.amber,
                ),
                SizedBox(width: 18),
                Text('Suraj Meena',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.wallet,
              size: 26,
              color: Colors.blue,
            ),
            title: const Text('Wallet',),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined,
              size: 26,
              color: Colors.blue,
            ),
            title: const Text('Address',),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share,
              size: 26,
              color: Colors.blue,
            ),
            title: const Text('Invite and Earn',),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings,
              size: 26,
              color: Colors.blue,
            ),
            title: const Text('Setting',),
            onTap: () {},
          ),   
        ],
      ),
    );
  }
}
