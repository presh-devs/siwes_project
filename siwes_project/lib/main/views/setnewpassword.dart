import 'package:flutter/material.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({Key? key}) : super(key: key);

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Text Editing Controller

  late final TextEditingController _newpassword;
  late final TextEditingController _confirmnewpassword;

  //init state and dispose
  @override
  void initState() {
    _newpassword = TextEditingController();
    _confirmnewpassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newpassword.dispose();
    _confirmnewpassword = TextEditingController();
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
                              'Set new',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              'password',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
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

                          //password field
                          TextFormField(
                            autofocus: false,
                            controller: _newpassword,
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
                              _newpassword.text = value!;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20, 10, 20, 10),
                              hintText: "Enter new password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 24,
                          ),

                          TextFormField(
                            autofocus: false,
                            controller: _confirmnewpassword,
                            obscureText: true,
                            validator: (value) {
                              if (_confirmnewpassword.text != _newpassword.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _confirmnewpassword.text = value!;
                            },
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                              hintText: "Confirm new password",
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
                          },

                          child: const Text(
                            'Set',
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