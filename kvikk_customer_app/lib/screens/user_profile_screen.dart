import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String name = 'John Doe';
  final String mobile = '+91 98765 43210';
  final String email = 'john.doe@example.com';
  final String address = '123, College Street, City, State';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'User Profile',
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
            // User details
            Text(
              'Name: $name',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Mobile: $mobile',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: $email',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Address: $address',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement edit address
              },
              child: Text('Edit Address'),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[700],
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement logout
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red[700],
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Past Orders',
              style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Order #12345', style: TextStyle(color: Colors.white)),
                    subtitle: Text('Delivered on 10 Aug 2023', style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.yellow[700]),
                    onTap: () {
                      // TODO: View order details
                    },
                  ),
                  ListTile(
                    title: Text('Order #12344', style: TextStyle(color: Colors.white)),
                    subtitle: Text('Delivered on 5 Aug 2023', style: TextStyle(color: Colors.grey)),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.yellow[700]),
                    onTap: () {
                      // TODO: View order details
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
