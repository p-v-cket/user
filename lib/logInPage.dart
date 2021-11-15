import 'package:custom/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:custom/colors.dart';
import 'package:custom/signColumn.dart';
import 'package:custom/signInPage.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _idFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _id = "";
  String _password = "";
  late RestClient client;


  _LogInPageState() {
    _idFilter.addListener(_idListen);
    _passwordFilter.addListener(_passwordListen);
    try {
      client = RestClient(Dio());
    } catch (e) {
      print("Error!!!! $e",);
    }
  }

  void _idListen() {
    if (_idFilter.text.isEmpty) {
      _id = "";
    } else {
      _id = _idFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '로그인',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: CUSTOMblue,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.chevron_left),
        ),
      ),
      body: new Container(
        color: CUSTOMblue,
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          InputBlank('아이디(전화번호)', _idFilter).build(),
          InputBlank('비밀번호', _passwordFilter).build(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Row(
        children: <Widget>[
          new ElevatedButton(
            child: new Text('Login'),
            onPressed: _loginPressed,
          ),
          new ElevatedButton(
            child: new Text('Sign Up'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
        ],

      ),
    );
  }

  void _loginPressed() {
    //print('$_name / $_phone / $_address / $_agree');
    //Customer user = Customer(name: _name, phone: _phone, area: _address, raw_password: _password);
    //client.signup(user).then((res) => print('성공!')).catchError((e) => print(e));
  }

  void _signupPressed() {

  }
}