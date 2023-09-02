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
      body: Form(
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

            // button to validate
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Validated'),
                    ),
                  );
                }
              },
              child: const Text('Validate'),
            ),

            // format example
          ],
        ),
      ),
    );
  }
}
