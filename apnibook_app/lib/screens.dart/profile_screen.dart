import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List transectionList = [
    {'name': 'Suraj Meena','dateTime': '16 Jan 22 - 12:30 PM', 'received': '0', 'paid': '555'},
    {'name': 'Chetan Chaudhary','dateTime': '1 Jan 24 - 10:00 AM', 'received': '5000', 'paid': '0'},
    {'name': 'Suraj Meena','dateTime': '5 Dec 23 - 1:30 PM', 'received': '0', 'paid': '20'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 48,
              color: Colors.amber,
            ),
            SizedBox(width: 18),
            Text(
              'Suraj Meena',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total Received",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2000",
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Total Paid",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "46300",
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "You Will Get",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2000",
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              color: Colors.grey.shade100,
              child: const Text("Payment History",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: transectionList.length,
                itemBuilder: (context, index) {
                  final transaction = transectionList[index];
                  final bool isReceived = int.parse(transaction['received']) > 0;
                  final Color rowColor = isReceived ? Colors.green.shade100 : Colors.red.shade100;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: rowColor,
                      child: ListTile(
                        title: Text(transaction['name']),
                        subtitle: Text(transaction['dateTime']),
                        leading: const Icon(Icons.wallet),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isReceived)
                              Text(
                                'Received: ${transaction['received']}',
                                style: const TextStyle(color: Colors.green),
                              ),
                            if (!isReceived)
                              Text(
                                'Paid: ${transaction['paid']}',
                                style: const TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      // side: const BorderSide(width: 2,color: Colors.black,)
                    ),
                  ),
                  child: const Text("Paid")
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(10),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      // side: const BorderSide(width: 1,color: Colors.black, style: BorderStyle.solid)
                    ),)
                  ),
                  child: const Text("Received")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
