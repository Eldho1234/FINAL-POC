import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _FirstNameController = TextEditingController();
  final TextEditingController _LastNameController = TextEditingController();
  final TextEditingController _EmpIdController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool shopass = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lets Register",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Account",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello user, you have",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "a graceful journey",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _FirstNameController,
                  decoration: InputDecoration(
                      label: const Text("First Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                          validator: (firstName) {
                            if(firstName==null || firstName.isEmpty){
                               return "Please enter a First name";
                            }
                          },
                          textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _LastNameController,
                  decoration: InputDecoration(
                      label: const Text("Last Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                          validator: (lastName) {
                            if (lastName == null || lastName.isEmpty) {
                      return "please enter a Last name";
                    }
                          },
                          textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _EmpIdController,
                  decoration: InputDecoration(
                      label: const Text("Emp id"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                           validator: (empId) {
                            if ( empId== null || empId.length == 6) {
                      return "Enter a valid Employee id,length should be equal to 5;";
                    }
                          },
                          textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _EmailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_box_sharp),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "please enter a email";
                    }
                    if (!isEmailVAlid(email)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _PasswordController,
                  obscureText: shopass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.visibility_off,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (shopass) {
                                shopass = false;
                              } else {
                                shopass = true;
                              }
                            });
                          },
                          icon: Icon(shopass == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.done,
                  validator: (Password) {
                    if (Password!.isEmpty || Password.length < 6) {
                      return 'Enter a valid password,length should bw greater than 6';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: size.height * 0.0750,
                    child: ElevatedButton(
                        onPressed: () {
                           final valid = formkey.currentState!.validate();
                        if (valid) {
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => HomePage(),
                          //     ));
                        } else {
                          return;
                        }
                        _FirstNameController.clear();
                        _LastNameController.clear();
                        _EmpIdController.clear();
                        _EmailController.clear();
                        _PasswordController.clear();
                        },
                        child: const Text("Sign Up"),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 147, 64, 255)),
                        ))),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                          text: "Already have an account ?\t",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(
                          text: "Login",
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 15),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginPage()));
                            }),
                    ])),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

bool isEmailVAlid(String email) {
  final RegExp emailREgx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return emailREgx.hasMatch(email);
}
