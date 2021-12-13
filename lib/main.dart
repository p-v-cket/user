import 'package:custom/provider/authProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:custom/colors.dart';
import 'package:custom/page/widgets/idCard.dart';
import 'package:custom/page/widgets/scrollView.dart';
import 'package:custom/page/logInPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthProvider())
    ],
    child: MyApp()
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Provider.of<AuthProvider>(context, listen: true).isValid(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'P()cket Master',
            theme: ThemeData(
              primarySwatch: CUSTOMblueM,
            ),
            home: snapshot.data ? MyHomePage() : LogInPage(),
          );
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'P()cket Master',
            theme: ThemeData(
              primarySwatch: CUSTOMblueM,
            ),
            home: Scaffold(
              backgroundColor: CUSTOMblue,
              body: Center(child: CircularProgressIndicator())
            ),
          );
        }
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset('assets/logo.svg'),
        centerTitle: true,
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications_outlined),
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  }),
              counter != 0
                  ? Positioned(
                      right: 11,
                      top: 11,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '$counter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: SizedBox(
                  child:Text(
                    '전자출입카드',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInPage()),
                  );
                },
                child: IDcard('김기성', '서울시 한남동', '010-1234-5678').buildCard(),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.50,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: CustomScrollViewContent(),
              );
            },
          ),
        ],
      ),
    );
  }
}

enum FormType { login, register }



