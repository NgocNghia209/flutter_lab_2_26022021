import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        children: [
          Container(), //Tạo background
          ListView(
            children: [
              Column(
                children: [
                  Container(
                    child: Card(
                      child: Column(
                        children: [
                          TextFormField(
                            key: Key('username'),
                            decoration: InputDecoration(
                                labelText: 'Email',
                                icon: Icon(Icons.email_outlined)),
                          ),
                          TextFormField(
                            key: Key('password'),
                            decoration: InputDecoration(
                                labelText: 'Mật khẩu',
                                icon: Icon(Icons.security)),
                            obscureText: true,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
