// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lab/costum.dart';
import 'package:lab/home_page.dart';
import 'package:lab/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // login form key
  late final GlobalKey<FormState> _loginForm;

// text editing controllers for the text fields
  late final TextEditingController _usernameController;
  late final TextEditingController _passworController;

  bool _showPassword = false;

  void _blend() {
    // init varabiles
    _loginForm = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _passworController = TextEditingController();
  }

  @override
  void initState() {
    super.initState();
    _blend();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passworController.dispose();
    super.dispose();
  }

// loading pop-up
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: RepaintBoundary(child: CircularProgressIndicator())),
          ),
        );
      },
    );
  }

// when user login successfully
  void _loggedIn() {
    final navigator = Navigator.of(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(successSnackbar("Logged in Successfully"));
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  // when user login failed
  void _loginFailed() {
    ScaffoldMessenger.of(context)
        .showSnackBar(failedSnackbar("Wrong credentials!"));
  }

  // login button callback function
  void _loginCallback() async {
    final navigator = Navigator.of(context);

    FocusManager.instance.primaryFocus?.unfocus();
    // validate inputs
    if (_loginForm.currentState!.validate()) {
      _showLoadingDialog();
      // validate username and password
      String username = _usernameController.text;
      String password = _passworController.text;
      // add some fake waiting pop ups
      await Future.delayed(
        const Duration(milliseconds: 800),
      );
      if (navigator.canPop()) {
        navigator.pop();
      }

      if (username == "admin" && password == "admin") {
        return _loggedIn();
      } else {
        return _loginFailed();
      }
    }
  }

// to show and hide pasword field
  void _showHidePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  // register page navigator 
  void _navigateRegisterPage (){
    final navigator = Navigator.of(context);
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: GestureDetector(
        // to dispose any focused element..
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

        child: Column(
          children: [
            // header image
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Image.asset(
                'assets/images/login.png',
                width: width * 0.6,
              ),
            ),

            // login form
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _loginForm,
                  child: Column(
                    children: [
                      // usernmae field
                      SizedBox(
                        // height: 60,
                        child: TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null) {
                              return "Please enter your username";
                            }
                            if (value.isEmpty) {
                              return "Please enter your username";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                      ),

                      // gap
                      const SizedBox(height: 20),

                      // passowrd field
                      SizedBox(
                        // height: 60,
                        child: TextFormField(
                          controller: _passworController,
                          obscureText: !_showPassword,
                          validator: (value) {
                            if (value == null) {
                              return "Please enter your password";
                            }
                            if (value.isEmpty) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            suffix: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: _showHidePassword,
                                  child: Icon(
                                    _showPassword
                                        ? Icons.remove_red_eye_rounded
                                        : Icons.remove_red_eye_outlined,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      ),

                      // gap
                      const SizedBox(height: 20),

                      // login button
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton(
                              onPressed: _loginCallback,
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),
                      // register link section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                             "Don't have account?" , style: TextStyle(color:  Colors.grey, ), 
                            
                          ),

                          GestureDetector(
                            onTap: _navigateRegisterPage,
                            child : Text( " register" , style: TextStyle(color:  Theme.of(context).primaryColor, ), )
                          )  
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
