import 'package:flutter/material.dart';

class ClientDetail extends StatefulWidget {
  const ClientDetail({Key? key, required this.item}) : super(key: key);

  final Map<String, dynamic> item;

  @override
  State<ClientDetail> createState() => _ClientDetailState();
}

class _ClientDetailState extends State<ClientDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Client's Details"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.item['avatar']),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(color: Colors.teal, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    '${widget.item['first_name']} ${widget.item['last_name']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Text(
                  'Email ID:',
                  style: TextStyle(color: Colors.teal, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    widget.item['email'],
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }
}
