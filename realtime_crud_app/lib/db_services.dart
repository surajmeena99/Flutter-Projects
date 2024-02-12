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

  Future<Map<String, dynamic>?> getData() async { 
    final snapshot = await _dbRef.get();
    if(snapshot.exists){
      Map<String, dynamic> snapshotValue = Map<String, dynamic>.from(snapshot.value as Map);
      return snapshotValue;
    } else {
      print("no data available");
    }
    return null;
  }

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
