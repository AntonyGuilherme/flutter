import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QRCode Reader',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'QRCode Reader'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  /*
    O	 método	 	_captureQR()		 será	 responsável	 por	 chamar	 o
    leitor	 de	 QR	 Codes,	 que	 abrirá	 a	 câmera	 do	 dispositivo	 e	 ficará
    analisando	 a	imagem	 e	 aguardando	 detectar	 um	 código	QR	 nela.
    Assim	 que	 o	 código	 for	 encontrado,	 ele	 vai	 chamar	 o	 método
	  _showDialog		 passando	 como	 parâmetro	 a	 	String	 	 que	 a
    decodificação	do	código	gerou.
  */

  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _captureQR() {
    Future<String> futureString = QRCodeReader()
        .setAutoFocusIntervalInMs(200)
        .setForceAutoFocus(true)
        .setTorchEnabled(true)
        .setHandlePermissions(true)
        .setExecuteAfterPermissionGranted(true)
        .scan();

    futureString.then((qrText) {
      _showDialog(qrText);
    }).catchError((error) {
      this._showDialog(error.toString());
    });
  }

  void _showDialog(String qrtext) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("QRCode's Text"),
            content: new Text(qrtext),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text('close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _captureQR();
                  });
                },
                child: Text('Read QrCode'))
          ],
        ),
      ),
    );
  }
}
