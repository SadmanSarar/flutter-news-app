import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            elevation: 4.0,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Image.network(
                      'https://picsum.photos/200/200',
                      height: 64,
                      width: 64,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sadman Sarar",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    Text("sadmansarar@gmail.com"),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox.fromSize(
                    size: Size(80, 40),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
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
                ),
                new ProfileMenu(
                  "Rate",
                  "Give your rate and feedback",
                  Icons.rate_review,
                ),
                new ProfileMenu(
                  "More",
                  "More Apps from developer",
                  Icons.more,
                ),
                new ProfileMenu(
                  "About",
                  '',
                  Icons.info,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final IconData _iconData;
  final String _title;
  final String _subTitle;
  const ProfileMenu(
    this._title,
    this._subTitle,
    this._iconData, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(_iconData,color: Colors.black87,),
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
                _subTitle.isNotEmpty ? Text(
                  _subTitle,
                  style: TextStyle(color: Colors.black54),
                ) : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
