import 'package:flutter/material.dart';

class CartCheckoutScreen extends StatefulWidget {
  @override
  _CartCheckoutScreenState createState() => _CartCheckoutScreenState();
}

class _CartCheckoutScreenState extends State<CartCheckoutScreen> {
  Map<String, int> cartItems = {
    'Sketchbook': 1,
    'Watercolor Set': 2,
  };

  Map<String, double> prices = {
    'Sketchbook': 250.0,
    'Watercolor Set': 1200.0,
  };

  String couponCode = '';
  bool applyQCoinDiscount = false;

  double handlingFee = 20.0;

  double get subtotal {
    double total = 0;
    cartItems.forEach((key, value) {
      total += (prices[key] ?? 0) * value;
    });
    return total;
  }

  double get qCoinDiscount {
    if (applyQCoinDiscount) {
      // For simplicity, assume user has enough Q-Coins for ₹10 discount
      return 10.0;
    }
    return 0.0;
  }

  double get grandTotal {
    return subtotal + handlingFee - qCoinDiscount;
  }

  String selectedPaymentMethod = 'COD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Cart & Checkout',
          style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: cartItems.keys.map((item) {
                  int quantity = cartItems[item]!;
                  double price = prices[item] ?? 0;
                  return Card(
                    color: Colors.grey[900],
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.shopping_cart, color: Colors.yellow[700]),
                      title: Text(
                        item,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '₹${price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.yellow[700]),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.yellow[700]),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  cartItems[item] = quantity - 1;
                                }
                              });
                            },
                          ),
                          Text(
                            quantity.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.yellow[700]),
                            onPressed: () {
                              setState(() {
                                cartItems[item] = quantity + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 8),
            // Coupon input
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Coupon Code',
                labelStyle: TextStyle(color: Colors.yellow[700]),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  couponCode = value;
                });
              },
            ),
            SizedBox(height: 8),
            // Q-Coin discount toggle
            Row(
              children: [
                Checkbox(
                  value: applyQCoinDiscount,
                  activeColor: Colors.yellow[700],
                  onChanged: (value) {
                    setState(() {
                      applyQCoinDiscount = value ?? false;
                    });
                  },
                ),
                Text(
                  'Apply Q-Coin Discount (₹10)',
                  style: TextStyle(color: Colors.yellow[700]),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Price summary
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Subtotal: ₹${subtotal.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Handling Fee: ₹${handlingFee.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Q-Coin Discount: -₹${qCoinDiscount.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ),
                Divider(color: Colors.grey),
                Text(
                  'Grand Total: ₹${grandTotal.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Payment options
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Options',
                  style: TextStyle(color: Colors.yellow[700], fontWeight: FontWeight.bold, fontSize: 16),
                ),
                RadioListTile<String>(
                  title: Text('Cash on Delivery (COD)', style: TextStyle(color: Colors.white)),
                  value: 'COD',
                  groupValue: selectedPaymentMethod,
                  activeColor: Colors.yellow[700],
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('UPI (Google Pay, PhonePe, Paytm)', style: TextStyle(color: Colors.white)),
                  value: 'UPI',
                  groupValue: selectedPaymentMethod,
                  activeColor: Colors.yellow[700],
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('Debit/Credit Card', style: TextStyle(color: Colors.white)),
                  value: 'Card',
                  groupValue: selectedPaymentMethod,
                  activeColor: Colors.yellow[700],
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Confirm order logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order Confirmed!')),
                );
              },
              child: Text('Confirm Order'),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[700],
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
