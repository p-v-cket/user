import 'package:custom/api/signInAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:custom/colors.dart';
import 'package:custom/page/widgets/signColumn.dart';
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _nameFilter = new TextEditingController();
  final TextEditingController _phoneFilter = new TextEditingController();
  final TextEditingController _addressFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  final TextEditingController _agreeFilter = new TextEditingController();
  String _name = "";
  String _phone = "";
  String _address = "";
  String _password = "";
  bool _agree = false;
  late RestClient client;


  _SignInPageState() {
    _nameFilter.addListener(_nameListen);
    _phoneFilter.addListener(_phoneListen);
    _addressFilter.addListener(_addressListen);
    _passwordFilter.addListener(_passwordListen);
    _agreeFilter.addListener(_agreeListen);
    try {
      client = RestClient(Dio());
    } catch (e) {
      print("Error!!!! $e",);
    }
  }

  void _nameListen() {
    if (_nameFilter.text.isEmpty) {
      _name = "";
    } else {
      _name = _nameFilter.text;
    }
  }

  void _phoneListen() {
    if (_phoneFilter.text.isEmpty) {
      _phone = "";
    } else {
      _phone = _phoneFilter.text;
    }
  }

  void _addressListen() {
    if (_addressFilter.text.isEmpty) {
      _address = "";
    } else {
      _address = _addressFilter.text;
    }
  }
  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _agreeListen() {
    if (_agreeFilter.text.isEmpty) {
      _agree = false;
    } else {
      _agree = _agreeFilter.text == "동의";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          '전자출입카드 등록하기',
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
          InputBlank('이름', _nameFilter).build(),
          InputBlank('연락처', _phoneFilter).build(),
          InputBlank('주소', _addressFilter).build(),
          InputBlank('비밀번호', _passwordFilter).build(),
          InputBlank('개인정보 수집 동의', _agreeFilter).build(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Login'),
            onPressed: _loginPressed,
          ),
        ],
      ),
    );
  }

  void _loginPressed() {
    print('$_name / $_phone / $_address / $_agree');
    Customer user = Customer(name: _name, phone: _phone, area: _address, raw_password: _password);
    client.signup(user).then((res) => print('성공!')).catchError((e) => print(e));
  }
}
