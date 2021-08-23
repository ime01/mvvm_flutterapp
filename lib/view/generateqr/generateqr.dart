
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutterapp/sharedprefernce/sharedpreference.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({Key? key}) : super(key: key);

  @override
  _GenerateQRPageState createState() => _GenerateQRPageState();
}

class _GenerateQRPageState extends State<GenerateQRPage> {

  TextEditingController controller = TextEditingController();
  String enteredText = 'hello';

  @override
    void initState()  {
    super.initState();
    enteredText = UserPreferences.getUserName() ?? 'hello2';

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR GENERATOR'),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: 300,
                embeddedImage: AssetImage('assets/jetpacklogo.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(size: Size(80,80)),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: '${enteredText}'
                  ),
                ),
              ),
              ElevatedButton(

                  child: Text('GENERATE QR'),

                  onPressed: () async {
                    await UserPreferences.setUserName(controller.text);
                    setState(()  {

                    });
                  },
                  )
            ],
          ),
        ),
      ),
    );
  }


}
