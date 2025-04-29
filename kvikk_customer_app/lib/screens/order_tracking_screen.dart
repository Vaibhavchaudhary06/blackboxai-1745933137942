import 'package:flutter/material.dart';
import 'dart:async';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Duration remainingTime = Duration(minutes: 15);
  Timer? countdownTimer;

  String deliveryPartnerName = 'Ravi Kumar';
  String deliveryPartnerNumber = '+91 98765 43210';

  bool isDelivered = false;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingTime = remainingTime - Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Order Tracking',
          style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Order Summary
            Card(
              color: Colors.grey[900],
              child: ListTile(
                title: Text(
                  'Order #12345',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '3 items',
                  style: TextStyle(color: Colors.yellow[700]),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Estimated Arrival Time (countdown)
            Text(
              'Estimated Arrival Time',
              style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              formatDuration(remainingTime),
              style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Delivery Partner Info
            Card(
              color: Colors.grey[900],
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.yellow[700]),
                title: Text(
                  deliveryPartnerName,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  deliveryPartnerNumber,
                  style: TextStyle(color: Colors.yellow[700]),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.call, color: Colors.yellow[700]),
                      onPressed: () {
                        // TODO: Implement call delivery partner
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            // Slide to complete
            isDelivered
                ? Text(
                    'Order Completed',
                    style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 18),
                  )
                : SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 48,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 24),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
                      activeTrackColor: Colors.yellow[700],
                      inactiveTrackColor: Colors.grey[700],
                      thumbColor: Colors.yellow[700],
                    ),
                    child: Slider(
                      value: 0,
                      min: 0,
                      max: 1,
                      onChanged: (value) {
                        if (value > 0.9) {
                          setState(() {
                            isDelivered = true;
                          });
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
