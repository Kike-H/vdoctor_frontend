import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdoctor_frontend/modules/API/vDoctor.dart';
import 'package:vdoctor_frontend/widgets/InputText.dart';

class SignupPage extends StatelessWidget {
  final input_name = InputText(label: 'Name');
  final input_lastname = InputText(label: 'LastName');
  final input_age = InputText(label: 'Age', typeKeyboard: TextInputType.number);
  final input_email = InputText(label: 'Email');
  final input_password = InputText(label: 'Password', obscureText: true);
  final input_password_r = InputText(label: 'Confirm Password', obscureText: true);

  VDoctorApi api = VDoctorApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  input_name,
                  input_lastname,
                  input_age,
                  input_email,
                  input_password,
                  input_password_r,
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    Map<String, dynamic> data = {
                      'name': input_name.getValue(),
                      'email': input_email.getValue(),
                      'password': input_password.getValue()
                    };
                    var response = await VDoctorApi.post("/user", data);
                    print(response);
                  },
                  color: Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("Already have an account?"),
                  Text(
                    " Login",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
