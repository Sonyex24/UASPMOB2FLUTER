import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mycalapp/screens/Home_Screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }


  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home_Screen()),
      );
    }
  }

  Future<void> _saveLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<void> _loginWithEmail() async {
    setState(() => _isLoading = true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      _saveLoginState(true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Screen()));
    } catch (e) {
      _showError(e.toString());
    }
    setState(() => _isLoading = false);
  }

  Future<void> _loginWithGoogle() async {
    setState(() => _isLoading = true);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      _saveLoginState(true);
      _saveUserData(userCredential.user);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home_Screen()));
    } catch (e) {
      _showError(e.toString());
    }
    setState(() => _isLoading = false);
  }

  Future<void> _loginWithFacebook() async {
    setState(() => _isLoading = true);
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken? accessToken = result.accessToken;

        if (accessToken != null) {
          final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.tokenString);
          final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);


          _saveUserData(userCredential.user);


          _saveLoginState(true);


          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home_Screen()));
        }
      } else {
        _showError("Login Facebook gagal: ${result.message}");
      }
    } catch (e) {
      _showError(e.toString());
    }
    setState(() => _isLoading = false);
  }

  Future<void> _saveUserData(User? user) async {
    if (user != null) {
      final userRef =
      FirebaseFirestore.instance.collection('users').doc(user.uid);
      await userRef.set({
        'name': user.displayName ?? "User",
        'email': user.email,
        'photoURL': user.photoURL,
      }, SetOptions(merge: true));
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("MyCal",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text("Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                fillColor: Colors.grey[200],
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Colors.grey[200],
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : ElevatedButton(
              onPressed: _loginWithEmail,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Center(
                  child: Text("Masuk",
                      style: TextStyle(color: Colors.white))),
            ),
            SizedBox(height: 10),
            GestureDetector(
              child: Center(
                child: Text(
                  "Belum Punya Akun? Daftar Disini",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text("Masuk Dengan Akun Ini")),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _loginWithGoogle,
                  child: Image.asset('assets/google.png', width: 50),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _loginWithFacebook,
                  child: Image.asset('assets/facebook.png', width: 50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
