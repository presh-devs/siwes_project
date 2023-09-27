import 'package:flutter/material.dart';
import 'package:siwes_project/features/authenticate/views/signup_screen.dart';
import 'package:siwes_project/features/password/views/forgotpassword_screen.dart';
import 'package:siwes_project/main/views/main_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Form key
  final _formKey = GlobalKey<FormState>();


  // Text Editing Controller
  late final TextEditingController _email;
  late final TextEditingController _password;

  //init state and dispose
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: AppBar(), //Purposely left blank for now
      body: Form(
        key: _formKey,
        child: SizedBox(

          height: MediaQuery.of(context).size.height,
          width: double.infinity,

          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Column(

                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xff99E79B), // Could be less Opaque
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 60),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[

                          //Email field
                          TextFormField(
                            autofocus: false,
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("This field is required");
                              }
                              // reg expression for email validation
                              if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid Email");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(

                              contentPadding: const EdgeInsets.fromLTRB(
                                  20, 10, 20, 10),
                              hintText: "Email Address",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 24,
                          ),

                          //Password field
                          TextFormField(
                            autofocus: false,
                            controller: _password,
                            obscureText: true,
                            validator: (value) {
                              RegExp regex = RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("This field is required");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Password(Min. 6 Character)");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _password.text = value!;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(

                              contentPadding: const EdgeInsets.fromLTRB(
                                  20, 10, 20, 10),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 24.0, 40.0, 0.0),
                      child: Container(
                        height: 40,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                        ),

                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 40,
                          color: Colors.blue.shade900,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          onPressed: () {
                            // Deactivated for now so we can naviagate to home screen
                            // _formKey.currentState!.validate();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const MyHomePage()));
                          },

                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 24.0, 40.0, 0.0),
                      child: Container(
                        height: 40,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                        ),

                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 40,
                          color: Colors.blue.shade900,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                          },

                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 24.0, 40.0, 0.0),
                      child: Container(
                        height: 40,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          ),
                        ),

                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 40,
                          color: const Color(0xffFF3333),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          onPressed: () {},

                          child: const Text(
                            'Continue with Google',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Don\'t have an account yet?',
                          style: TextStyle(),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}