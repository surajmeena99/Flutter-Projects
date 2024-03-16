import 'package:flutter/material.dart';
import 'package:nbl_app/add_user.dart';
import 'package:nbl_app/database_service.dart';
import 'package:nbl_app/login_screen.dart';
import 'package:nbl_app/user_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late Future<List<User>> _userList;

  @override
  void initState() {
    super.initState();
    _userList = DatabaseService().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Dashboard", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushReplacement(context, 
                MaterialPageRoute(builder: (context)=> const LoginScreen())
              );
            }, 
            icon: const Icon(Icons.logout, size: 30,)
          )
        ],
      ),
      drawer: const Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, size: 50,color: Colors.blue,),
                      SizedBox(width: 15,),
                      Text("Suraj Meena", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home,color: Colors.purple,),
                  title: Text("Home"),
                ),
                SizedBox(height: 5,),
                ListTile(
                  leading: Icon(Icons.wallet,color: Colors.purple,),
                  title: Text("Wallet"),
                ),
                ListTile(
                  leading: Icon(Icons.location_on,color: Colors.purple,),
                  title: Text("Address"),
                ),
                ListTile(
                  leading: Icon(Icons.settings,color: Colors.purple,),
                  title: Text("Settings"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: _userList, 
        builder: (context, snapshot){
          if(snapshot.hasData){
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index){
                final user = users[index];
                return ListTile(
                  title: Text('${user.firstName} ${user.lastName}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(user.email,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  trailing: Row(
                    children: [
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.edit)
                      ),
                      const SizedBox(width: 5,),
                      IconButton(
                        onPressed: (){}, 
                        icon: const Icon(Icons.delete)
                      )
                    ],
                  ),
                );
              }
  
              );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => const AddUser())
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}