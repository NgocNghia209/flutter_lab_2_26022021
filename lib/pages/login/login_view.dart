import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'email_card.dart';

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
            Positioned.fill(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 2,
              child: Container(
                color: Colors.white,
              ),
            ),
            Positioned.fill(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    constraints: BoxConstraints(
                        //minHeight: constraints.maxHeight,
                        ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          width: 500,
                          child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: Column(
                                children: [
                                  EmailCard(
                                    onLoginPressed: (email, password) {
                                      //TODO tiến hành xử lí đăng nhập ở đây
                                      print('$email, $password');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
