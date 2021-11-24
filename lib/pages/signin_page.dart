import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:treeko/services/auth.dart';
import 'home_page.dart';
import 'singnup_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool _passwordVisible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/bg.gif",
          fit: BoxFit.fitHeight,
          height: 1000.0,
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Text("SignIn",
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Color.fromRGBO(217,8,98, 100.0),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 50.0,
              ),
              Card(
                color: const Color.fromRGBO(3, 148, 244, 70.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/1.1,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: usernameController,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Username',
                              hintText: 'Enter Username',

                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                color: Colors.white,
                              ),
                              fillColor: Colors.white,
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              )),
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: passwordController,
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(
                                Icons.security_rounded,
                                color: Colors.white,
                              ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).disabledColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                              fillColor: Colors.white,
                              labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                          ),
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ButtonTheme(
                        height: 50.0,
                        minWidth: 450.0,
                        // buttonColor: Colors.deepOrange,
                        child:  FlatButton(
                            splashColor: Colors.lightBlueAccent,
                            color: Colors.black38,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0)
                            ),
                            onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));}
                            ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Forget Password!",
                        textAlign: TextAlign.right,
                        style:
                            TextStyle(color: Colors.black38, fontSize: 17.0),
                      ),
                    )
                  ]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("-OR-", style: TextStyle(color: Colors.black38,fontSize: 16.0,fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width/2.3,
                    child: FlatButton(
                      splashColor: Colors.redAccent,
                      color: Colors.black38,
                      child: Row(
                        children:  const [
                          Text("Meta",style: TextStyle(color: Colors.white,fontSize: 16)),
                          SizedBox(width: 10,),
                          Icon(
                            Icons.facebook_rounded,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ],
                      ),
                      onPressed: (){/*TODO: add gmailregistation*/},
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width/2.3,
                    child:  FlatButton(
                      color: Colors.black38,
                      splashColor: Colors.redAccent,
                      child: Row(
                        children: const [
                          Text("Gmail",style: TextStyle(color: Colors.white,fontSize: 16)),
                            SizedBox(width: 10,),
                          Icon(
                            Icons.mail_outline_rounded,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ]
                      ),
                      onPressed: (){
                        AuthMethods().signInWithGoogle(context);
                      },
                    ),
                  ),
                ]
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width/1.1,
                child: FlatButton(
                  splashColor: Colors.redAccent,
                  color: Colors.black38,
                  child: const Text("Register",style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));},
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
