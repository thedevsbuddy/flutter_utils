import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ValidatorExamplePage(),
    );
  }
}

class ValidatorExamplePage extends StatefulWidget {
  const ValidatorExamplePage({Key? key}) : super(key: key);

  @override
  State<ValidatorExamplePage> createState() => _ValidatorExamplePageState();
}

class _ValidatorExamplePageState extends State<ValidatorExamplePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validator Example"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: null,
              keyboardType: TextInputType.text,
              validator: (value) => Validator("Email", value!).between(6, 8).validate(),
            ),
          ],
        ),
      ),
    );
  }
}
