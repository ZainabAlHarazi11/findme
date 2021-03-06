import 'package:findme/_routing/routes.dart';
import 'package:findme/_routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:findme/_routing/routes.dart';
import 'package:findme/utils/colors.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'package:findme/Services/auth.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({ this.toggleView });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;
  bool obscureText = true;

  String Error ='';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String userEmail = '';
  String userPass = '';

  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    final pageTitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Log In.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        Text(
          "Welcome back!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    final  appBar2 = AppBar(

      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Register'),
          onPressed: () => widget.toggleView(),
        ),
      ],
    );

    final emailField = TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.envelope,
          color: Colors.white,

        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      validator: (val) => val.isEmpty ? 'Enter your email' : null,
      onChanged: (val){
        setState(() => userEmail = val);
      },
    );

    final passwordField = TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.lock,
          color: Colors.white,
        ),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: obscureText,
      validator: (val) =>
      val.isEmpty
          ? 'Enter Your password'
          : null,
      onChanged: (val){
        setState(() => userPass = val);
      },
    );

    final loginForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[emailField, passwordField],
        ),
      ),
    );

    final forgotPassword = Padding(
      padding: EdgeInsets.only(left: 1060.0, top: 10),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, resetPasswordViewRoute),
        child: Center(
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    final loginBtn = Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.white),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      child: RaisedButton(
        elevation: 5.0,
        color: Colors.white,
        //onPressed: ()=> Navigator.pushNamed(context, homeViewRoute),

        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),

        child: MaterialButton(
          child: Text(
            'LOG IN',
            style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
          ),
        ),
            onPressed: () async {
              if(_formKey.currentState.validate()){
                dynamic result = await _auth.signInWithEmailAndPassword(userEmail, userPass);
                if(result == null) {
                  setState(() {
                    Error = 'Could not sign in with those credentials';
                  });
                }
              }
            }
  ),
      ),
    );


    Widget remember() {
      return Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value;
                  });
                },
              ),
            ),
            Text('Remember me',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold))
          ],
        ),
      );
    }

    final newUser = Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account? ',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, registerViewRoute),
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0),
          decoration: BoxDecoration(gradient: primaryGradient),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              pageTitle,
             // appBar2,
              loginForm,
              forgotPassword,
              remember(),
              loginBtn,
              SizedBox(height: 12.0),
              Text(
                  Error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0)
              ),
              newUser,
            ],
          ),
        ),
      ),
    );
  }
}
