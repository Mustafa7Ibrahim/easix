import 'package:easix/easix.dart';
import 'package:flutter/material.dart';

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
              const Text('Date and time example'),
              const Text('----------------'),
              Text('Normal Date: ${DateTime.now()}'),
              Text('Human Date: ${DateTime.now().toHumanDate()}'),
              const Text('----------------'),
              Text('Time Of Day format: ${TimeOfDay.now().toHIS()}'),
              const Text('----------------'),
              Text('Year Month Day format: ${DateTime.now().toYMD()}'),
              const Text('----------------'),
              Text(
                'Human String Date format ${DateTime.now().toString().toHumanStringDate()}',
              ),
              24.ph,
              // button to validate
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Validated successfully \nand converted to human readable date and time successfully \n${DateTime.now().toHumanDate()} \n${DateTime.now().toYMD()} \n${TimeOfDay.now().toHIS()} \n${DateTime.now().toString().toHumanStringDate()},',
                        ),
                      ),
                    );
                  }
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
