import 'package:flutter/material.dart';

class StockBook extends StatefulWidget {
  const StockBook({super.key});

  @override
  State<StockBook> createState() => _StockBookState();
}

class _StockBookState extends State<StockBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Book"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
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
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.charging_station_rounded, size: 50, color: Colors.green,),
                    const SizedBox(height: 5,),
                    const Text("Charger"),
                    Container(
                      width: 50,
                      child: const Divider(thickness: 1, color: Colors.green,)
                    ),
                    const Text("2")
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.keyboard, size: 50, color: Colors.green,),
                    const SizedBox(height: 5,),
                    const Text("Keyboard"),
                    Container(
                      width: 50,
                      child: const Divider(thickness: 1, color: Colors.green,)
                    ),
                    const Text("2")
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.laptop_mac, size: 50, color: Colors.green,),
                    const SizedBox(height: 5,),
                    const Text("laptop"),
                    Container(
                      width: 50,
                      child: const Divider(thickness: 1, color: Colors.green,)
                    ),
                    const Text("4")
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone_android_rounded, size: 50, color: Colors.green,),
                    const SizedBox(height: 5,),
                    const Text("Mobile"),
                    Container(
                      width: 50,
                      child: const Divider(thickness: 1, color: Colors.green,)
                    ),
                    const Text("2")
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green
                  ),
                  borderRadius: BorderRadius.circular(50)              
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.home_work_rounded, size: 50, color: Colors.green,),
                    const SizedBox(height: 5,),
                    const Text("XYZ"),
                    Container(
                      width: 50,
                      child: const Divider(thickness: 1, color: Colors.green,)
                    ),
                    const Text("4")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}