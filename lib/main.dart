import 'package:animated_menu_list/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> menuItems = [
    {
      "title": "Settings",
      "subtitle": "Change the settings of the app",
      "icon": SvgPicture.asset(
        "icons/setting.svg",
        color: textColor,
      ),
      "onTap": () {
        print("Settings");
      }
    },
    {
      "title": "Notifications",
      "subtitle": "See all the notifications",
      "icon": SvgPicture.asset(
        "icons/notification.svg",
        color: textColor,
      ),
      "onTap": () {
        print("Settings");
      }
    },
    {
      "title": "Cart",
      "subtitle": "Manage your cart",
      "icon": SvgPicture.asset(
        "icons/cart.svg",
        color: textColor,
      ),
      "onTap": () {
        print("Settings");
      }
    },
    {
      "title": "Invite Friends",
      "subtitle": "Invite your friends to the app",
      "icon": SvgPicture.asset(
        "icons/mail.svg",
        color: textColor,
      ),
      "onTap": () {
        print("Settings");
      }
    },
  ];
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: listbackColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              width: 320,
              // height: 340,

              child: Column(
                  children: menuItems
                      .map((e) => InkWell(
                            onTap: e["onTap"],
                            onHover: (val) {
                              if (val) {
                                setState(() {
                                  selectedIndex = menuItems.indexOf(e);
                                });
                              } else {
                                setState(() {
                                  selectedIndex = null;
                                });
                              }
                            },
                            child: AnimatedContainer(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: selectedIndex == menuItems.indexOf(e)
                                    ? textColor.withOpacity(0.4)
                                    : textColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  if (selectedIndex == menuItems.indexOf(e))
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                ],
                              ),
                              duration: Duration(milliseconds: 500),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      gradient:
                                          selectedIndex == menuItems.indexOf(e)
                                              ? RadialGradient(
                                                  radius: 2.5,
                                                  center: Alignment.center,
                                                  colors: [
                                                      listbackColor,
                                                      textColor,
                                                    ])
                                              : LinearGradient(colors: [
                                                  iconBackground,
                                                  iconBackground,
                                                ]),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    width: 45,
                                    height: 45,
                                    child: e["icon"],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e["title"],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: textColor),
                                      ),
                                      Text(
                                        e["subtitle"],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                            color: textColor),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList()),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
