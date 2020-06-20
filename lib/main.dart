import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:mailer2/mailer.dart';

const PrimaryColor = const Color.fromRGBO(16, 155, 197, 1);

var options = new GmailSmtpOptions()
  ..username = 'coreavparis2020m@gmail.com'
  ..password = 'Stavros1234*';

var emailTransport = new SmtpTransport(options);

// Create our mail/envelope.


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
      return Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: const Text('Volver a inicio'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 60),
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'QUALITY CLOUDWORKS, S.L.',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Isla del Hierro 6',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      '10005 Cáceres',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      '665 678 487 | info@qualitycw.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16.0, left: 16.0),
                    child: Text(
                      'Por favor contacta con nosotros pulsando aquí para organizar una demo gratuita',
                      style: TextStyle(fontSize: 16),
                    ),

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
                      onPressed: () async {
                        const url = 'http://qualitycw.com/stackbooking';

                        if (await canLaunch(url)) {
                          await launch(url, forceSafariVC: false);
                        } else {
                          throw 'Lo sentimos no se pudo acceder';
                        }
                        var envelope = new Envelope()
                          ..from = 'coreavparis2020m@gmail.com'
                          ..recipients.add('info@qualitycw.com')
                          ..subject = 'Acceso contacto desde Stack Booking App'
                          ..text = 'Acceso contacto desde Stack Booking App'
                          ..html = 'Acceso contacto desde Stack Booking App';
                        
                        emailTransport.send(envelope)
                            .then((envelope) => print('Email sent!'))
                            .catchError((e) => print('Error occurred: $e'));
                      },
                      child: Text(
                        "Solicitar demo",
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
                    /*...*/
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
