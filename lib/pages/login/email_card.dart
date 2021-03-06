import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum EmailCardStatus { login, reset }

class EmailCard extends StatefulWidget {
  //Đăng nhập
  final void Function(String email, String password) onLoginPressed;

  //Khôi phục mật khẩu
  final void Function(String email) onResetPressed;

  const EmailCard({Key key, this.onLoginPressed, this.onResetPressed})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmailCardState();
}

class _EmailCardState extends State<EmailCard> {
  var _status = EmailCardStatus.login;

  ///EmailCardStatus get status => _status; => đây là getter in dart
  /// setter in dart
  set status(value) {
    setState(() {
      _status = value;
    });
  }

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///Trạng thái đăng nhập
        Visibility(
          visible: _status == EmailCardStatus.login,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đăng nhập hệ thống',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              TextFormField(
                key: _emailKey,
                decoration: InputDecoration(
                    labelText: 'Email', icon: Icon(Icons.email_outlined)),
              ),
              TextFormField(
                key: _passwordKey,
                decoration: InputDecoration(
                    labelText: 'Mật khẩu', icon: Icon(Icons.security)),
                obscureText: true,
                //dùng để che mật khẩu.
                validator: (value) {
                  if (value.length < 6) return 'Mật khẩu không hợp lệ';
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_passwordKey.currentState.validate()) {
                        final _email = _emailKey.currentState.value;
                        final _password = _passwordKey.currentState.value;
                        widget.onLoginPressed(_email, _password);
                      }
                    },
                    child: Text('Đăng nhập'),
                  ),
                  TextButton(
                    onPressed: () => status = EmailCardStatus.reset,
                    child: Text('Quên mật khẩu?'),
                  ),
                ],
              ),
            ],
          ),
        ),

        ///Trạng thái khôi phục mật khẩu
        Visibility(
          visible: _status == EmailCardStatus.reset,
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lấy lại mật khẩu',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                TextFormField(
                  key: _emailKey,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|Ư~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value ?? '');
                    if (!emailValid) return 'Email không hợp lệ';
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text('Khôi phục'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        if (_emailKey.currentState.validate()) {
                          final _email = _emailKey.currentState.value;
                          widget.onResetPressed(_email);
                        }
                      },
                      child: Text('Khôi phục'),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    RaisedButton(
                      onPressed: () => status = EmailCardStatus.login,
                      child: Text('Bỏ qua'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
