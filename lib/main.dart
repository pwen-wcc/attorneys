import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Future<String> buttonPressed() async {
    String url = 'http://127.0.0.1:8000/attorneys/';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Accept': 'application/json'},
    );
    print("DjangoApi: ${response.body}");

    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clever Tech Memes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar:
                AppBar(centerTitle: true, title: const Text('Attorneys Test')),
            body: Center(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: const Text('Click here to retrieve list.')),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ElevatedButton(
                      onPressed: buttonPressed, child: Text('Click')),
                )
              ],
            ))));
  }
}
