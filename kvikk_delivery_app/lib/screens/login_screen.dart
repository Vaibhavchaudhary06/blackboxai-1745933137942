import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String mobile = '';
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Partner Login'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone, color: Colors.yellow[700]),
                ),
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter mobile number' : null,
                onSaved: (value) => mobile = value ?? '',
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ID Verification',
                  prefixIcon: Icon(Icons.badge, color: Colors.yellow[700]),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your ID' : null,
                onSaved: (value) => id = value ?? '',
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Implement login and admin approval verification
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Login')),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
