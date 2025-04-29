import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Ravi Kumar';
  String id = 'DP12345';
  bool isVerified = true;
  int totalDeliveries = 120;
  String selectedTimeSlot = '9 AM - 5 PM';

  final List<String> timeSlots = [
    '9 AM - 5 PM',
    '10 AM - 6 PM',
    '11 AM - 7 PM',
    '12 PM - 8 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                if (isVerified)
                  Icon(Icons.verified, color: Colors.yellow[700], size: 24),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'ID: $id',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Total Deliveries: $totalDeliveries',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Available Time Slot',
              style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedTimeSlot,
              dropdownColor: Colors.grey[900],
              iconEnabledColor: Colors.yellow[700],
              items: timeSlots.map((slot) {
                return DropdownMenuItem<String>(
                  value: slot,
                  child: Text(
                    slot,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedTimeSlot = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
