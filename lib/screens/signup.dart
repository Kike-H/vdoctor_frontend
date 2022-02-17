import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vdoctor_frontend/modules/API/vDoctor.dart';


class SignupPage extends StatelessWidget {
	final input_name = InputFile(label: 'Username');
	final input_email = InputFile(label: 'Email');
	final input_password = InputFile(label: 'Password', obscureText: true);
	final input_password_r = InputFile(label: 'Confirm Password', obscureText: true);

	VDoctorApi api = VDoctorApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,

                  ),),
                  SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)
                ],
              ),
              Column(
                children: <Widget>[
                  input_name,
                  input_email,
                  input_password,
                  input_password_r,
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )
                ),
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
                  child: Text(
                    "Sign up", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(" Login", style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
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

// we will be creating a widget for text field
class InputFile extends StatelessWidget {
	 final String label;
	 final bool obscureText;
	 TextEditingController controller = TextEditingController();


	InputFile({required this.label, this.obscureText=false, Key? key}) : super(key: key);

	String getValue() {
		return controller.text.toString();
	}

	@override
	Widget build(BuildContext context) {
		return Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					SizedBox(
						height: 5,
					),
					TextField(
							obscureText: this.obscureText,
							decoration: InputDecoration(
									labelText: this.label,
									contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
									enabledBorder: OutlineInputBorder(
											borderSide: BorderSide(
													color: Colors.grey
										),
          				),
									border: OutlineInputBorder(
											borderSide: BorderSide(color: Colors.grey)
									)
							),
							controller: controller,
					),
					SizedBox(height: 10,)
				],
		);
	}
}
