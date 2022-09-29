import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Login',
      home: Scaffold(
        appBar: AppBar(title: const Text("Stateless Login")),
        body: StatelessLogin(),
      ),
    );
  }
}

class StatelessLogin extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  StatelessLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Username"),
        TextField(
          controller: usernameController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        const Text("Password"),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(20.0),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        // To place component side by side inside the same row
        Row(children: [
          Expanded(
            child: TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => RegisterDialog(
                        usernameController.text,
                        passwordController.text,
                      )),
              child: const Text("Register"),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => LoginDialog(
                        usernameController.text,
                        passwordController.text,
                      )),
              child: const Text("Login"),
            ),
          ),
        ]),
      ],
    );
  }
}

class LoginDialog extends StatelessWidget {
  final String username;
  final String password;

  const LoginDialog(this.username, this.password, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Login dialog'),
      content: Text('$username tried to login with password: $password'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class RegisterDialog extends StatelessWidget {
  final String username;
  final String password;

  const RegisterDialog(this.username, this.password, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Register dialog'),
      content: Text('trying to register $username with password: $password'),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
