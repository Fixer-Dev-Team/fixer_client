import 'package:fixer_client/screens/account.dart';
import 'package:fixer_client/util/color.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController;
  double pageOffset = 0;
  final currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
      print(pageOffset.truncate());
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 7,
            child: PageView(
              controller: pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) => currentPageNotifier.value = index,
              children: <Widget>[
                Page(
                  title: "Find Casual Services Easily",
                  body: "Something's broken? Worry-less, we've got you!",
                  imagePath: "assets/warning.png",
                  offset: pageOffset - 1,
                ),
                Page(
                  title: "Anywhere, Anytime and Affordably",
                  body:
                      "Connect to a service worker from the comfort of your house, office or car",
                  imagePath: "assets/relax.png",
                  offset: pageOffset - 2,
                ),
                Page(
                  title: "Pay with favourite method",
                  body: "Transactions made easy and smooth",
                  imagePath: "assets/transfer.png",
                  offset: pageOffset - 3,
                ),
                Page(
                  title: "Welcome to Fixer",
                  body:
                      "We are always happy to be of help, be nice to leave a review",
                  imagePath: "assets/feedback.png",
                  offset: pageOffset - 4,
                )
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: pageOffset.truncate() == 3
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountScreen(),
                              ),
                            );
                          },
                    child: Text(
                      "Skip all",
                      style: TextStyle(
                        color:
                            pageOffset.truncate() != 3 ? fixerBlue : fixerGrey,
                      ),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: pageOffset == i ? fixerBlue : Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: fixerBlue,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  FlatButton(
                    onPressed: pageOffset != 3
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AccountScreen(),
                              ),
                            );
                          },
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        color: pageOffset == 3 ? fixerBlue : fixerGrey,
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String imagePath;
  final String title;
  final String body;
  final double offset;

  Page({this.imagePath, this.title, this.body, this.offset});

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.09));
    return Column(
      children: <Widget>[
        Image.asset(
          imagePath,
          fit: BoxFit.fitWidth,
          height: MediaQuery.of(context).size.height * 0.65,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline
                .copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Transform.translate(
            offset: Offset(-100 * gauss, 0),
            child: Opacity(
              opacity: 0.7,
              child: Text(
                body,
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
