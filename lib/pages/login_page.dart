import 'package:flutter/material.dart';
import 'package:stack_booking/pages/home_page.dart';

const PrimaryColor = const Color.fromRGBO(16, 155, 197, 1);

void openHome(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return HomePage();
    },
  ));
}

class LoginPage extends StatefulWidget {

  @override
  createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;
  String _forbidden;

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
              SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'CORREO ELECTRÓNICO',
                      hintText: 'Correo electrónico'
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  )
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'CONTRASEÑA',
                      hintText: 'Contraseña'
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
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
                      if(_email == "pp@pp.com" && _password == "pepe") {
                        openHome(context);
                      } else {
                        setState(() {
                          _forbidden = "Email o contraseña incorrectos";
                        });
                      }
                    },
                    child: Text(
                      "Añadir",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ),
                Column(
                  children: <Widget>[
                    if (_forbidden != null) ...[
                      Text('$_forbidden')
                    ],
                  ] 
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