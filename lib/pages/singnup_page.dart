import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {

  bool _passwordVisible = false;


  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(241, 240, 240, 1.0),
        elevation: 0,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }
            , icon: const Icon(Icons.arrow_back_rounded,color: Colors.pinkAccent,),),
      ),
      body: Stack(children: <Widget>[
        Image.asset(
          "assets/bg.gif",
          fit: BoxFit.fitHeight,
          height: 1000.0,
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Text("Register",
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Color.fromRGBO(217,8,98, 100.0),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 30.0,
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelText: 'Email',
                              hintText: 'Enter Email Id',

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
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0)
                            ),
                            onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomePage()));}
                        ),
                      ),
                    ),
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
                        onPressed: (){/*TODO: add gmailregistation*/ },
                      ),
                    ),
                  ]
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
