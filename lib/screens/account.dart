import 'package:fixer_client/util/color.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/network.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black87,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              //physics: BouncingScrollPhysics(),
              controller: pageController,
              children: <Widget>[
                _login(),
                _register(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _login() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          "assets/checked.png",
          height: MediaQuery.of(context).size.height * 0.13,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
          child: Text(
            "Sign in",
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Email Address",
              labelStyle: TextStyle(color: Colors.white60),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(color: Colors.white60),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: RawMaterialButton(
            child: Text(
              "Sign up",
              style: TextStyle(
                  letterSpacing: 0.6,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            fillColor: fixerBlue,
            splashColor: Colors.black,
            constraints: BoxConstraints(
              minHeight: 40,
              minWidth: double.infinity,
            ),
            onPressed: () {},
          ),
        ),
        FlatButton(
          onPressed: () {
            //TODO
          },
          child: Text(
            "Forgot password?",
            style: TextStyle(color: fixerBlue),
          ),
        ),
        FlatButton(
          onPressed: () {
            pageController.jumpToPage(1);
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'sign up',
                  style: TextStyle(
                    color: fixerBlue,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _register() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          "assets/checked.png",
          height: MediaQuery.of(context).size.height * 0.13,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 10.0),
          child: Text(
            "Sign up",
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(color: Colors.white),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      //todo
                    },
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      labelStyle: TextStyle(color: Colors.white60),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 5),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      //todo
                    },
                    decoration: InputDecoration(
                      labelText: "First Name",
                      labelStyle: TextStyle(color: Colors.white60),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: "Email Address",
              labelStyle: TextStyle(color: Colors.white60),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white60),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      //todo
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white60),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 5),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      //todo
                    },
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.white60),
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: RawMaterialButton(
            child: Text(
              "Sign up",
              style: TextStyle(
                  letterSpacing: 0.6,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            fillColor: fixerBlue,
            splashColor: Colors.black,
            constraints: BoxConstraints(
              minHeight: 40,
              minWidth: double.infinity,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'By signing in, you are agree in our ',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'terms & conditions',
                  style: TextStyle(
                    color: fixerBlue,
                  ),
                )
              ],
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            pageController.jumpToPage(0);
          },
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'sign in',
                  style: TextStyle(
                    color: fixerBlue,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
