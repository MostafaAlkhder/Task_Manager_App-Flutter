import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/pages/layout.dart';
import 'package:task_manager_app/provider/authProvider.dart';
import 'package:task_manager_app/provider/homeProvider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthProvider _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                _authProvider.setUserName(value);
              },
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onChanged: (value) {
                // PROVIDER.setPassword(value)
                _authProvider.setPassword(value);
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _authProvider.userLogin();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<HomeProvider>(
                        create: (context) => HomeProvider(),
                        child: Layout(),
                      ), // Replace NextPage() with the name of your next page widget
                    ));
              },
              child: Text('Login'),
            ),
            _authProvider.isLoginLoading
                ? CircularProgressIndicator()
                : SizedBox(),
            Text(_authProvider.responseUser.username ?? 'Not Found')
          ],
        ),
      ),
    );
  }
}
