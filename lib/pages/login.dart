import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formGlobalKey = GlobalKey<FormState>();
  SharedPreferences?prefs;
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    prefs = data['prefs'];
    return Scaffold(
      appBar: AppBar(
        title: Text('shared preferences'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Column(
                children: [
                  Image.asset('assets/aa.jpg'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(35, 10, 35, 10),
                    child: TextFormField(
                      validator:(value){
                        if(value!.isEmpty){
                          return "username is empty";
                        }else{null;}
                      } ,
                      controller: controller1,
                      decoration: const InputDecoration(
                          label: Text(
                            'Name',
                            style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple), borderRadius: BorderRadius.all(Radius.circular(10)))),
                      cursorHeight: 25,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35, 30, 35, 10),
                    child: TextFormField(
                      validator:(value){
                        if(value!.isEmpty){
                          return "password is empty";
                        }else{null;}
                      },
                      controller: controller2,
                      decoration: const InputDecoration(
                          label: Text(
                            'password',
                            style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple), borderRadius: BorderRadius.all(Radius.circular(10)))),
                      cursorHeight: 25,
                      style: TextStyle(fontSize: 20),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {validate();},
                    child: const Text(
                      'Login',
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void validate() {
    if(formGlobalKey.currentState!.validate()){
      if(prefs?.getString('username')!=controller1.text&&prefs?.getString('password')!=controller2.text){
        Fluttertoast.showToast(
            msg: "Invalid user name",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0
        );
        return;
      }
      Navigator.pushReplacementNamed(context, '/second');

    }


  }
}
