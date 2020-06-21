import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:mailer2/mailer.dart';

const PrimaryColor = const Color.fromRGBO(16, 155, 197, 1);

var options = new GmailSmtpOptions()
  ..username = 'coreavparis2020m@gmail.com'
  ..password = 'Stavros1234*';

var emailTransport = new SmtpTransport(options);

class ContactPage extends StatefulWidget {

  @override
  createState() => _ContactPageState();

}

class _ContactPageState extends State<ContactPage> {

  @override
  Widget build(BuildContext context) {
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
  }

}