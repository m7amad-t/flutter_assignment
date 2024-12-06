import 'package:flutter/material.dart';
import 'package:lab/costum.dart';
import 'package:lab/home_page.dart';
import 'package:lab/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // login form key
  late final GlobalKey<FormState> _loginForm;

// text editing controllers for the text fields
  late final TextEditingController _usernameController;
  late final TextEditingController _passworController;
  late final TextEditingController _confirmPassworController;

  bool _showPassword = false;

  bool _isMale = true;

  void _blend() {
    // init varabiles
    _loginForm = GlobalKey<FormState>();
    _usernameController = TextEditingController();
    _passworController = TextEditingController();
    _confirmPassworController = TextEditingController();
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
              child: RepaintBoundary(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }

// when user login successfully
  void _registered() {
    final navigator = Navigator.of(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(successSnackbar("Registerd Successfully"));
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }



  // login button callback function
  void _register() async {
    final navigator = Navigator.of(context);

    FocusManager.instance.primaryFocus?.unfocus();
    // validate inputs
    if (_loginForm.currentState!.validate()) {
      _showLoadingDialog();
      // validate username and password
      String username = _usernameController.text;
      String password = _passworController.text;
      String confirmPassword = _confirmPassworController.text;
      String gander = _isMale ? "Male" : "Female"; 
      // add some fake waiting pop ups
      await Future.delayed(
        const Duration(milliseconds: 800),
      );
      if (navigator.canPop()) {
        navigator.pop();
      }

      print("""
          
        ---------------------------------------------------------------
        |  New User have been registerd : 
        |  Username : $username
        |  password : $password 
        |  Confirm Password : $confirmPassword
        |  gander : $gander
        ---------------------------------------------------------------

""");


    _registered();
    }
  }

// to show and hide pasword field
  void _showHidePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  // login page navigator
  void _navigateLoginPage() {
    final navigator = Navigator.of(context);
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          GestureDetector(
            // to dispose any focused element..
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

            child: Column(
              children: [
                // header image
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Image.asset(
                    'assets/images/register.png',
                    width: width * 0.6,
                  ),
                ),

                // login form
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                  return "Please enter username";
                                }
                                if (value.isEmpty) {
                                  return "Please enter username";
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
                                  return "Please enter password";
                                }
                                if (value.isEmpty) {
                                  return "Please enter password";
                                }

                                if (_passworController.text !=
                                    _confirmPassworController.text) {
                                  return "Password does't match";
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

                          // confirm passowrd field
                          SizedBox(
                            // height: 60,
                            child: TextFormField(
                              controller: _confirmPassworController,
                              obscureText: !_showPassword,
                              validator: (value) {
                                if (value == null) {
                                  return "Please enter confirm password";
                                }
                                if (value.isEmpty) {
                                  return "Please enter confirm password";
                                }

                                if (_passworController.text !=
                                    _confirmPassworController.text) {
                                  return "Password does't match";
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
                                labelText: 'Confirm Password',
                              ),
                            ),
                          ),

                          // gap
                          const SizedBox(height: 20),
                          // gander toogle section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ganderB(true, "Male", _isMale, () {
                                setState(() {
                                  _isMale = true;
                                });
                              }),
                              ganderB(false, "Female", !_isMale, () {
                                setState(() {
                                  _isMale = false;
                                });
                              }),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // register button
                          Row(
                            children: [
                              Expanded(
                                child: FilledButton(
                                  onPressed: _register,
                                  child: const Text(
                                    'Register',
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
                                "Already have an account ?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: _navigateLoginPage,
                                child: Text(
                                  " login",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
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
        ],
      ),
    );
  }

  Widget ganderB(
      bool left, String gander, bool isActive, GestureTapCallback action) {
    return InkWell(
      onTap: action,
      child: Container(
        width: 120,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:
                left ? const Radius.circular(10) : const Radius.circular(0),
            bottomLeft:
                left ? const Radius.circular(10) : const Radius.circular(0),
            bottomRight:
                !left ? const Radius.circular(10) : const Radius.circular(0),
            topRight:
                !left ? const Radius.circular(10) : const Radius.circular(0),
          ),
          color: isActive ? Theme.of(context).primaryColor : Colors.grey,
        ),
        child: Text(
          gander,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
