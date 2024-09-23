import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class NumberService {
  // The base URL for your Firebase Realtime Database
  final String baseUrl = 'https://solat-sum-default-rtdb.asia-southeast1.firebasedatabase.app/';

  Future<void> listenForSumUpdates(Function(int?) onUpdate) async {
    await Firebase.initializeApp();
    final app = Firebase.app();
    final database = FirebaseDatabase.instanceFor(
      databaseURL: 'https://solat-sum-default-rtdb.asia-southeast1.firebasedatabase.app',
      app: app,
    );
    final ref = database.ref('sum');

    // Continuously listen for updates
    ref.onValue.listen((DatabaseEvent event) {
      final snapshot = event.snapshot;
      if (snapshot.exists) {
        final value = snapshot.value;
        if (value is int) {
          onUpdate(value); // Call the callback function with the updated sum
        } else {
          print('Data at "sum" is not an integer.');
        }
      } else {
        print('No data available at "sum".');
      }
    });
  }

  // Function to fetch the current sum
  Future<int> fetchSum() async {
    final response = await http.get(Uri.parse('$baseUrl/sum.json'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data ?? 0; // If no sum exists, return 0
    } else {
      throw Exception('Failed to load sum');
    }
  }

  // Function to add a new number and update the sum
  Future<void> addNumber(int number) async {
    // Fetch the current sum
    int currentSum = await fetchSum();

    // Update the sum
    int newSum = currentSum + number;

    // Update the database with the new sum
    await http.put(
      Uri.parse('$baseUrl/sum.json'),
      body: jsonEncode(newSum),
    );
  }
}