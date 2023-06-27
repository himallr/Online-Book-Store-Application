import 'package:book_shopping_app/model/user_model.dart';
import 'package:book_shopping_app/pages/home_page.dart';
import 'package:book_shopping_app/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email Address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Valid email' : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(

                      labelText: 'Password',
                      hintText: 'Enter Password',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {},
                    validator: (value) {
                      return value!.isEmpty ? 'Enter Valid password' : null;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context)
                            .unfocus(); //to hide the keyboard - if any

                        // UserModel userModel =
                            await authProvider.signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text);

                        // if (userModel == null) {
                        //   _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        //     content: Text(AppLocalizations.of(context)
                        //         .translate("loginTxtErrorSignIn")),
                        //   ));
                        // }
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
