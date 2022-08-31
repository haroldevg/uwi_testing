import 'package:example_test/screens/example_home_view.dart';
import 'package:example_test/utils/field_validator_mixin.dart';
import 'package:flutter/material.dart';

class ExampleLoginView extends StatefulWidget {
  const ExampleLoginView({Key? key}) : super(key: key);

  @override
  State<ExampleLoginView> createState() => _ExampleLoginViewState();
}

class _ExampleLoginViewState extends State<ExampleLoginView>
    with FieldValidatorMixin {
  late String _email;
  late String _password;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _email = '';
    _password = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: const Text(
                  'Flutter login example',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            key: const Key('login_textfield_email_key'),
                            decoration:
                                const InputDecoration(labelText: 'Email'),
                            onSaved: (value){
                              _email = (value != null ? value.trim() : '');
                            },
                            validator: validateEmail,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            key: const Key('login_textfield_password_key'),
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            onSaved: (value) {
                              _password = (value != null ? value.trim() : '');
                            },
                            validator: validatePassword,
                            obscureText: true,
                          ),
                          const SizedBox(height: 40),
                          MaterialButton(
                            key: Key('login_button_enter_key'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ExampleHomeView(user: _email)));
                              }
                            },
                            child: Text('Ingresar'),
                            color: Colors.amber,
                          )
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
