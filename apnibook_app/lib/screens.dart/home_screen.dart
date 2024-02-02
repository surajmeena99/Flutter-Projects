import 'package:flutter/material.dart';
import 'package:apnibook_app/screens.dart/clients_screen.dart';
import 'package:apnibook_app/screens.dart/stock_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apnibook App"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      drawer:  Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
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
                color: Colors.green,
              ),
              title: const Text('Wallet',),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined,
                size: 26,
                color: Colors.green,
              ),
              title: const Text('Address',),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 35,
            mainAxisSpacing: 10,
          ),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ClientScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.switch_account,size: 50, color: Colors.green,),
                    SizedBox(height: 5,),
                    Text("Client Book"),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ClientScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.money,size: 50, color: Colors.green,),
                    SizedBox(height: 5,),
                    Text("Business Book"),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StockBook()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.stacked_bar_chart,size: 50, color: Colors.green,),
                    SizedBox(height: 5,),
                    Text("Stock Book"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ClientScreen()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.view_list_outlined,size: 50, color: Colors.green,),
                    SizedBox(height: 5,),
                    Text("Expense Book"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
            child: const Icon(Icons.question_mark),
          ),
          const SizedBox(height: 5), // Adjust the spacing between the button and text as needed
          const Text("Help",
            style: TextStyle(color: Colors.black87), // Adjust text style as needed
          ),
        ],
      ),
    );
  }
}