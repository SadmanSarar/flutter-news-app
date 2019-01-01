import 'package:flutter/material.dart';
import 'package:news_app_flutter/data/api/models/Status.dart';
import 'package:news_app_flutter/data/auth/AuthRemoteService.dart';

class ChangePasswordDialogWIdget extends StatefulWidget {
  const ChangePasswordDialogWIdget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  ChangePasswordDialogWIdgetState createState() {
    return new ChangePasswordDialogWIdgetState();
  }
}

class ChangePasswordDialogWIdgetState
    extends State<ChangePasswordDialogWIdget> {
  TextEditingController currentPass = TextEditingController(text: '');
  TextEditingController newsPass = TextEditingController(text: '');
  TextEditingController confirmPass = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();
  final authService = AuthRemoteService.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("Current Password"),
                  TextFormField(
                      controller: currentPass,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter old password';
                        }
                      }),
                  SizedBox.fromSize(size: Size.fromHeight(16)),
                  Text("New Password"),
                  TextFormField(
                      controller: newsPass,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter new password';
                        }
                      }),
                  SizedBox.fromSize(size: Size.fromHeight(16)),
                  Text("Confirm New Password"),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please confirm new password';
                      }
                      if (newsPass.text != value) {
                        return 'Please new password and confirm password doesn\'t match';
                      }
                    },
                    controller: confirmPass,
                    obscureText: true,
                  ),
                  SizedBox.fromSize(size: Size.fromHeight(16)),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _showLoadingDialog(
                            'Please Wait', 'Changing password...');
                        authService
                            .changePassword(
                          newsPass.text,
                          currentPass.text,
                        )
                            .then((value) {
                          Navigator.of(context).pop();
                          if (value.status == Status.SUCCESS) {
                            _showMessageDialog('Success', value.message,
                                action: () {
                              Navigator.of(context).pop();
                            });
                          } else {
                            _showMessageDialog('Error', value.message);
                          }
                        }).catchError((e, s) {
                          print(e);
                          print(s);
                          Navigator.of(context).pop();
                          _showMessageDialog('Error', 'Something went wrong');
                        });
                      }
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _showMessageDialog(String title, String msg,
      {action: Function}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                action();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLoadingDialog(String title, String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 4.0, bottom: 4.0, left: 2.0, right: 16.0),
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    msg,
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
