import 'package:stack_booking/pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:stack_booking/pages/login_page.dart';

const PrimaryColor = const Color.fromRGBO(16, 155, 197, 1);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Stack Booking App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

void openContact(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return ContactPage();
    },
  ));
}

void openLogin(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return LoginPage();
    },
  ));
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              margin: new EdgeInsets.all(5.0),
              child: Image.asset('assets/images/logo.png')
            );  
          },
        ),
        backgroundColor: PrimaryColor,
        title: const Text('Stack Booking'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Info adicional',
            onPressed: () {
              openContact(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: 100),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'BIENVENIDOS A',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'STACK BOOKING',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Reservas online',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'en cualquier momento',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: FlatButton(
                  color: PrimaryColor,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    openLogin(context);
                  },
                  child: Text(
                    "Inicie sesión",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              )
            ],
          ),
          Builder(
            builder: (BuildContext context) {
              return Container(
                margin: new EdgeInsets.all(20.0),
                child: Image.asset('assets/images/FEDER_OFERTA_COMPUTACION.gif')
              );  
            },
          ),
        ]
      )
    );
  }
}
