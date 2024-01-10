import 'package:flutter/material.dart';
import 'package:lab_11_main/screens/home.dart';
import 'package:lab_11_main/sercice/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Sign Up Page',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter, full name !' : null,
                    onChanged: (val) {
                      setState(() {
                        fullName = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter, email !' : null,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    validator: (val) =>
                        val!.length < 6 ? 'Password should be 6+ long !' : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already, have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('sign_in');
                          },
                          child: const Text('Sign In')),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(fullName, email, password);
                        if (result == null) {
                          setState(() =>
                              error = 'Please, supply valid credentials !');
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(user: result)));
                          // print(result);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 35.0),
                      backgroundColor: Colors.indigo,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
