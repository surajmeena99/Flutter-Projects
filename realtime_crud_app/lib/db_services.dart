import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child("products");

  Future<void> addData(Map<String, dynamic> data) async {
    try {
      await _dbRef.push().set(data);
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  //-----------for fetch data only one time-----------------

  Future<DatabaseEvent> getData() {
    return _dbRef.once();
  }

  // Future<DataSnapshot> getData() async {
  //   DatabaseEvent event = await _dbRef.once();
  //   DataSnapshot snapshot = event.snapshot;
  //   return snapshot;
  // }

  /*---------
  Future<Map<String, dynamic>?> getData() async {
    DataSnapshot snapshot = (await _dbRef.once()) as DataSnapshot;
      if(snapshot.exists){
        Map<String, dynamic> dataMap = Map<String, dynamic>.from(snapshot.value as Map);
        return dataMap;
      } else {
        print("no data available");
      }
      return null;
  }
  -----------*/

//-------------------------------------for update in realtime ------------------------------------------

  // Stream<DatabaseEvent> getData() {
  //   return _dbRef.onValue;
  // }

  
  /*-----------
  Stream<Map<String, dynamic>> getData() {
    return _dbRef.onValue.map((event) {
      if (event.snapshot.value != null) {
        Map<String, dynamic> dataMap = Map<String, dynamic>.from(event.snapshot.value as Map);
        return dataMap;
      } else {
        print("No data available");
      }
      return {};
    });
  }
  ------------*/


  Future<void> updateData(String id, String name, double price) async {
    try {
      await _dbRef.child(id).update({
        'name': name,
        'price': price,
      });
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await _dbRef.child(id).remove();
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}
