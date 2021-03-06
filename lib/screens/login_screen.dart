import 'package:flutter/material.dart';

import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            SizedBox(
              height: 25.0,
            ),
            submitButton(),
          ],
        ));
  }

  StreamBuilder emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            // onChanged: (value) => bloc.changEmail(value), same as below
            onChanged: bloc.changEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Address',
                errorText: snapshot.error),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: snapshot.error));
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
        child: Text('Login'), color: Colors.blue, onPressed: () {});
  }
}
