

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:example_test/main.dart' as app;


Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main(){

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Success Login to Home Screen', (tester) async {

    app.main();

    await tester.pumpAndSettle();

    var email = 'example@hotmail.com';

    var emailTextFieldKey = const Key('login_textfield_email_key');
    var passwordTextFieldKey = const Key('login_textfield_password_key');
    var loginButtonEnterKey = const Key('login_button_enter_key');

    final Finder emailTextFieldFinder = find.byKey(emailTextFieldKey);
    await tester.enterText(emailTextFieldFinder, email);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    final Finder passwordTextFieldFinder = find.byKey(passwordTextFieldKey);
    await tester.enterText(passwordTextFieldFinder, '1234567');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    final Finder loginButtonEnterFinder = find.byKey(loginButtonEnterKey);
    await tester.tap(loginButtonEnterFinder);

    await tester.pumpAndSettle();

  });


}