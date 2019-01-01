import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/settings/SettingRemoteService.dart';
import '../../data/settings/SettingRepository.dart';
import '../page/LoginPage.dart';
import '../page/PrivacyPolicyPage.dart';
import '../../data/settings/User.dart';
import 'ChangePasswordDialogWidget.dart';

class ProfilePageWidget extends StatefulWidget {
  @override
  _ProfilePageWidgetState createState() {
    return _ProfilePageWidgetState();
  }
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  var settings = SettingRepository.create();
  User user;
  @override
  void initState() {
    super.initState();
    settings.getUser().then((onValue) {
      setState(() {
        user = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SettingRemoteService().fetchSettings('1234');
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getUserWidget(user),
            Card(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new ProfileMenu(
                    "Privacy Policy",
                    "App Terms and Policy",
                    Icons.lock,
                    callback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PrivacyPolicyPage(),
                        ),
                      );
                    },
                  ),
                  new ProfileMenu(
                      "Rate", "Give your rate and feedback", Icons.rate_review,
                      callback: () {
                    LaunchReview.launch();
                  }),
                  new ProfileMenu(
                    "More",
                    "More Apps from developer",
                    Icons.more,
                    callback: () {
                      _launchURL('http://sadmansarar.xzy');
                    },
                  ),
                  new ProfileMenu(
                    "About",
                    '',
                    Icons.info,
                    callback: () {
                      _launchURL('http://sadmansarar.xzy');
                    },
                  ),
                  new ProfileMenu(
                    "Logout",
                    '',
                    Icons.power_settings_new,
                    callback: () {
                      settings.saveApiToken('');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getUserWidget(User user) {
    if (user == null) {
      return Container();
    }
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ClipOval(
                  child: Image.network(
                    user.image.isEmpty
                        ? 'https://picsum.photos/200/200'
                        : user.image,
                    height: 56,
                    width: 56,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  Text(user.email),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    onPressed: () {
                      _showChangePasswordScreen();
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showChangePasswordScreen() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangePasswordDialogWIdget(
              context: context,
            )));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
          msg: "Cannot launch URL. Visit: sadmansarar.xyz",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 2,
          backgroundColor: Colors.black87,
          textColor: Colors.white);
    }
  }
}

class ProfileMenu extends StatelessWidget {
  final IconData _iconData;
  final String _title;
  final String _subTitle;
  final GestureTapCallback callback;

  const ProfileMenu(this._title, this._subTitle, this._iconData,
      {Key key, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                _iconData,
                color: Colors.black87,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  _title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                _subTitle.isNotEmpty
                    ? Text(
                        _subTitle,
                        style: TextStyle(color: Colors.black54),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
