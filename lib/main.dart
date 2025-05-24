import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    if (username == 'user' && password == 'pass123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 10),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {'name': 'Dr. Alice', 'image': 'assets/images/doc1.png'},
      {'name': 'Dr. Bob', 'image': 'assets/images/doc2.png'},
      {'name': 'Dr. Carol', 'image': 'assets/images/doc3.png'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            child: ListTile(
              leading: Image.asset(doctor['image']!, width: 50, height: 50),
              title: Text(doctor['name']!),
              trailing: ElevatedButton(
                child: const Text('Book'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AppointmentForm1()),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}



class AppointmentForm1 extends StatefulWidget {
  const AppointmentForm1({super.key});

  @override
  State<AppointmentForm1> createState() => _AppointmentForm1State();
}

class _AppointmentForm1State extends State<AppointmentForm1> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _selectedSex = 'Male';
  final _problemController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appointment Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
              TextFormField(controller: _ageController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Age')),
              DropdownButtonFormField<String>(
                value: _selectedSex,
                decoration: const InputDecoration(labelText: 'Sex'),
                items: ['Male', 'Female', 'Other'].map((sex) => DropdownMenuItem(value: sex, child: Text(sex))).toList(),
                onChanged: (value) {
                  if (value != null) setState(() => _selectedSex = value);
                },
              ),
              TextFormField(controller: _problemController, decoration: const InputDecoration(labelText: 'Problem Info')),
              TextFormField(controller: _dateController, decoration: const InputDecoration(labelText: 'Expected Consultation Date')),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AppointmentForm2()),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class AppointmentForm2 extends StatefulWidget {
  const AppointmentForm2({super.key});

  @override
  State<AppointmentForm2> createState() => _AppointmentForm2State();
}

class _AppointmentForm2State extends State<AppointmentForm2> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderController = TextEditingController();
  final _expiryController = TextEditingController();
  final _ccvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _cardNumberController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Credit Card No')),
              TextFormField(controller: _cardHolderController, decoration: const InputDecoration(labelText: 'Card Holder\'s Name')),
              TextFormField(controller: _expiryController, decoration: const InputDecoration(labelText: 'Expiry Date')),
              TextFormField(controller: _ccvController, obscureText: true, decoration: const InputDecoration(labelText: 'CCV')),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // No actual logic needed as per your request
                },
                child: const Text('Complete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

