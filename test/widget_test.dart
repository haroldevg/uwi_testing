
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:example_test/main.dart';

void main() {
  testWidgets('Login attempt flow', (WidgetTester tester) async {

    await tester.pumpWidget(const MyApp());

    var email = 'prueba@hotmail.com';
    var password = '1234567';

    var emailTextFieldKey = const Key('login_textfield_email_key');
    var passwordTextFieldKey = const Key('login_textfield_password_key');
    var loginButtonEnterKey = const Key('login_button_enter_key');


    var emailTextField = find.byKey(emailTextFieldKey);
    var passwordTextField = find.byKey(passwordTextFieldKey);
    var buttonEnter = find.byKey(loginButtonEnterKey);


    expect(emailTextField, findsOneWidget);
    expect(passwordTextField, findsOneWidget);
    expect(buttonEnter, findsOneWidget);


    await tester.enterText(emailTextField, email);
    await tester.enterText(passwordTextField, password);

    await tester.tap(buttonEnter);

    await tester.pumpAndSettle();

    expect(find.text('Hola! ${email}'),findsOneWidget);

  });
}
