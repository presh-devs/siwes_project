import 'package:flutter/material.dart';
import 'package:siwes_project/main/views/setnewpassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

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

  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
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
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              'Forgot',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              'Password?',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(
                                height: 15),

                            Text(
                              'Please enter your email and we will send an OTP',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),

                            SizedBox(
                                height: 60),

                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[

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
                              hintText: "Enter your email",
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

                            _formKey.currentState!.validate();
                           // Navigator.of(context).push(MaterialPageRoute(
                              //  builder: (context) => const SetNewPassword()));


                            //You can uncomment that to see the screen for now before linking it

                          },
                          child: const Text(
                            'Send code',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
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