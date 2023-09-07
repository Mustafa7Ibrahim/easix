import 'package:easix/easix.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easix Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _weekPasswordController = TextEditingController();

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('easix Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // custom padding
              // custom padding horizontal and vertical
              // 12.ph == SizedBox(height: 12)
              // 12.pw == SizedBox(width: 12)
              // 12.p == SizedBox(width: 12, height: 12)
              Row(
                children: [
                  12.pw,
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  12.pw,
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  12.pw,
                ],
              ),
              Column(
                children: [
                  12.ph,
                  Container(
                    color: Colors.red,
                    height: 100,
                  ),
                  12.ph,
                  Container(
                    color: Colors.red,
                    height: 100,
                  ),
                  12.ph,
                ],
              ),
              12.p,

              // validate example

              // Validate name example
              TextFormField(
                controller: _nameController,

                /// you can use validator like this
                /// or even add a custom validator error message
                /// validator: (value) => value.validateName('custom error message'),
                validator: (value) => value.validateName(),
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),

              // Validate email example
              TextFormField(
                controller: _emailController,

                /// you can use validator like this
                /// or even add a custom validator error message
                /// validator: (value) => value.validateEmail(error: 'custom error message'),
                validator: (value) => value.validateEmail(),
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),

              // Validate password example
              TextFormField(
                controller: _passwordController,

                /// you can use validator like this
                /// or even add a custom validator error message
                /// validator: (value) => value.validatePassword(error: 'custom error message'),
                validator: (value) => value.validatePassword(),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  errorMaxLines: 5,
                ),
              ),

              // Validate confirm password example
              TextFormField(
                controller: _confirmPasswordController,

                /// you can use validator like this
                /// or even add a custom validator error message
                /// you can also add error message for not match password
                /// validator: (value) => value.validatePassword(confirmPassword: _passwordController.text, error: 'custom error message' errorNotMatch: 'custom error message'),
                /// with confirm password validator
                validator: (value) => value.validatePassword(
                  confirmPassword: _passwordController.text,
                  error: 'Password and confirm password not match',
                  errorNotMatch: 'Password and confirm password not match',
                ),
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
              ),

              // Validate week password example
              TextFormField(
                controller: _weekPasswordController,

                /// you can use validator like this
                /// or even add a custom validator error message
                /// validator: (value) => value.validateWeakPassword(error: 'custom error message'),
                /// with week password validator where it's not necessary to have a number or special character
                validator: (value) => value.validateWeakPassword(),
                decoration: const InputDecoration(
                  labelText: 'Week Password',
                ),
              ),
              24.ph,
              Text(
                "Now (English): ${now.toHumanDate()}\n"
                "Before 1 Hour (English): ${now.subtract(const Duration(hours: 1)).toHumanDate()}\n"
                "Before 1 Day (English): ${now.subtract(const Duration(days: 1)).toHumanDate()}\n"
                "Before 2 Days (English): ${now.subtract(const Duration(days: 2)).toHumanDate()}\n"
                "Before 10 Days (English, Short): ${now.subtract(const Duration(days: 10)).toHumanDate()}\n"
                "Before 10 Days (English, Full): ${now.subtract(const Duration(days: 10)).toHumanDate(displayType: DateMode.full)}\n"
                "Before 1 Month (English): ${now.subtract(const Duration(days: 30)).toHumanDate()}\n"
                "Before 1 Year (English, full): ${now.subtract(const Duration(days: 365)).toHumanDate(displayType: DateMode.full)}\n"
                "-----------------------------------\n"
                "Before 1 Hour (Arabic): ${now.subtract(const Duration(hours: 1)).toHumanDate(language: DateLang.ar)}\n"
                "Before 1 Day (Arabic): ${now.subtract(const Duration(days: 1)).toHumanDate(language: DateLang.ar)}\n"
                "Before 2 Days (Arabic): ${now.subtract(const Duration(days: 2)).toHumanDate(language: DateLang.ar)}\n"
                "Before 10 Days (Arabic, Short): ${now.subtract(const Duration(days: 10)).toHumanDate(language: DateLang.ar)}\n"
                "Before 10 Days (Arabic, Full): ${now.subtract(const Duration(days: 10)).toHumanDate(displayType: DateMode.full, language: DateLang.ar)}\n"
                "Before 1 Month (Arabic): ${now.subtract(const Duration(days: 30)).toHumanDate(language: DateLang.ar)}\n"
                "Before 1 Year (Arabic, full): ${now.subtract(const Duration(days: 365)).toHumanDate(language: DateLang.ar, displayType: DateMode.full)}\n"
                "-----------------------------------\n"
                "After 1 Hour (English): ${now.add(const Duration(hours: 1)).toHumanDate()}\n"
                "After 1 Day (English): ${now.add(const Duration(days: 1)).toHumanDate()}\n"
                "After 2 Days (English): ${now.add(const Duration(days: 2)).toHumanDate()}\n"
                "After 10 Days (English, Short): ${now.add(const Duration(days: 10)).toHumanDate()}\n"
                "After 10 Days (English, Full): ${now.add(const Duration(days: 10)).toHumanDate(displayType: DateMode.full)}\n"
                "After 1 Month (English): ${now.add(const Duration(days: 30)).toHumanDate()}\n"
                "After 1 Year (English, full): ${now.add(const Duration(days: 365)).toHumanDate()}\n"
                "-----------------------------------\n"
                "After 1 Hour (Arabic): ${now.add(const Duration(hours: 1)).toHumanDate(language: DateLang.ar)}\n"
                "After 1 Day (Arabic): ${now.add(const Duration(days: 1)).toHumanDate(language: DateLang.ar)}\n"
                "After 2 Days (Arabic): ${now.add(const Duration(days: 2)).toHumanDate(language: DateLang.ar)}\n"
                "After 10 Days (Arabic, Short): ${now.add(const Duration(days: 10)).toHumanDate(language: DateLang.ar)}\n"
                "After 10 Days (Arabic, Full): ${now.add(const Duration(days: 10)).toHumanDate(displayType: DateMode.full, language: DateLang.ar)}\n"
                "After 1 Month (Arabic): ${now.add(const Duration(days: 30)).toHumanDate(language: DateLang.ar)}\n"
                "After 1 Year (Arabic, full): ${now.add(const Duration(days: 365)).toHumanDate(language: DateLang.ar, displayType: DateMode.full)}\n",
              ),
              24.ph,
              // button to validate
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text('Validate and convert'),
              ),

              24.ph,
            ],
          ),
        ),
      ),
    );
  }
}
