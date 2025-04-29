import 'package:flutter/material.dart';

class ActiveDeliveriesScreen extends StatefulWidget {
  @override
  _ActiveDeliveriesScreenState createState() => _ActiveDeliveriesScreenState();
}

class _ActiveDeliveriesScreenState extends State<ActiveDeliveriesScreen> {
  String pickupAddress = '123 College Street, City';
  String dropLocation = '456 Market Road, City';
  int deliveryCount = 5;
  double earnings = 1500.0;

  bool isPicked = false;
  bool isDelivered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Active Deliveries',
          style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.grey[900],
              child: ListTile(
                title: Text(
                  'Pickup Address',
                  style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  pickupAddress,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: Colors.yellow[700]),
                  onPressed: () {
                    // TODO: Call vendor
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            Card(
              color: Colors.grey[900],
              child: ListTile(
                title: Text(
                  'Drop Location',
                  style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  dropLocation,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: Colors.yellow[700]),
                  onPressed: () {
                    // TODO: Call customer
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: isPicked
                      ? null
                      : () {
                          setState(() {
                            isPicked = true;
                          });
                        },
                  child: Text('Mark as Picked'),
                  style: ElevatedButton.styleFrom(
                    primary: isPicked ? Colors.grey : Colors.yellow[700],
                    onPrimary: Colors.black,
                    minimumSize: Size(140, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: isPicked && !isDelivered
                      ? () {
                          setState(() {
                            isDelivered = true;
                          });
                        }
                      : null,
                  child: Text('Mark as Delivered'),
                  style: ElevatedButton.styleFrom(
                    primary: isDelivered ? Colors.grey : Colors.yellow[700],
                    onPrimary: Colors.black,
                    minimumSize: Size(140, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Card(
              color: Colors.grey[900],
              child: ListTile(
                title: Text(
                  'Delivery Count',
                  style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  deliveryCount.toString(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              color: Colors.grey[900],
              child: ListTile(
                title: Text(
                  'Earnings (Today)',
                  style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '₹${earnings.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
