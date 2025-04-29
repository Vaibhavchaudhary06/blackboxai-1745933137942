import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String name = '';
  String mobile = '';
  String password = '';
  DateTime? dob;

  TextEditingController dobController = TextEditingController();

  Future<void> _selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dob ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.yellow[700]!,
              onPrimary: Colors.black,
              surface: Colors.grey[900]!,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != dob) {
      setState(() {
        dob = picked;
        dobController.text = "${dob!.day}/${dob!.month}/${dob!.year}";
      });
    }
  }

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kvikk Login / Signup'),
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
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person, color: Colors.yellow[700]),
                ),
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
                onSaved: (value) => name = value ?? '',
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mobile No.',
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
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.yellow[700]),
                ),
                obscureText: true,
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter password' : null,
                onSaved: (value) => password = value ?? '',
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(Icons.cake, color: Colors.yellow[700]),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.yellow[700]),
                    onPressed: () => _selectDOB(context),
                  ),
                ),
                readOnly: true,
                style: TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Select date of birth' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Implement signup/login logic and OTP verification
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Sign Up / Login'),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton.icon(
                  onPressed: () async {
                    // Simulate fetching Q-Coins from Qura
                    int quraQCoins = await fetchQuraQCoins();
                    // Navigate to QCoinScreen with fetched coins
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QCoinScreen(initialCoins: quraQCoins),
                      ),
                    );
                  },
                  icon: Icon(Icons.login, color: Colors.yellow[700]),
                  label: Text(
                    'Sign up via Qura',
                    style: TextStyle(color: Colors.yellow[700]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
