import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'command_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    final userfromdatabase =
        _auth.currentUser; // see whether await should come here or not
    try {
      if (userfromdatabase != null) {
        loggedInUser = userfromdatabase;
        print(loggedInUser.email);
      } else {
        print("what the fuck ");
      }
    } catch (e) {
      print(e);
    }
  }

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COGU APP',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              size: 25.0,
              color: Colors.red[800],
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                CardForLaptop(
                  cardChild: SizedBox(
                    height: 100.0,
                    width: 110.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10.0,
                            width: 1.0,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  FontAwesomeIcons.circleNotch,
                                  size: 30.0,
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Parwaan's Laptop",
                                  style: knamingtextstyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10.0,
                            width: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPress: () {
                    Navigator.pushNamed(context, 'command_screen');
                  },
                ),
                CardForLaptop(
                  cardChild: SizedBox(
                    height: 100.0,
                    width: 110.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10.0,
                            width: 1.0,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  FontAwesomeIcons.circleNotch,
                                  size: 30.0,
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Abhyam's Laptop",
                                  style: knamingtextstyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10.0,
                            width: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPress: () {
                    Navigator.pushNamed(context, 'command_screen');
                  },
                ),
                CardForAppliance(
                  cardChild: SizedBox(
                    height: 100.0,
                    width: 110.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10.0,
                            width: 1.0,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  FontAwesomeIcons.circleNotch,
                                  size: 30.0,
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Light 1",
                                  style: knamingtextstyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                  activeTrackColor: Colors.lightGreenAccent,
                                  inactiveThumbColor: Colors.red,
                                  inactiveTrackColor: Colors.redAccent[100],
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 10.0,
                            width: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardForLaptop extends StatelessWidget {
  CardForLaptop({this.cardChild, this.onPress});

  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFF1D1E33),
        ),
      ),
    );
  }
}

class CardForAppliance extends StatelessWidget {
  CardForAppliance({
    this.cardChild,
  });

  final Widget cardChild;
  // final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFF1D1E33),
        ),
      ),
    );
  }
}
// class CardForLaptop extends StatelessWidget {
//   CardForLaptop({this.onPress, this.laptopName, this.connectcolor});

//   String laptopName;
//   Function onPress;
//   Color connectcolor;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         child: Card(
//           child: Row(
//             children: <Widget>[
//               Icon(
//                 FontAwesomeIcons.circle,
//                 size: 30.0,
//                 color: connectcolor,
//               ),
//               SizedBox(
//                 width: 20.0,
//                 height: 0.0,
//               ),
//               Text(
//                 '$laptopName',
//                 style: knamingtextstyle,
//               ),
//             ],
//           ),
//         ),
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: Color(0xFF1D1E33),
//         ),
//       ),
//     );
//   }
// }

// class CardForAppliance extends StatelessWidget {
//   CardForAppliance(
//       {this.onPress, this.applianceName, this.connectcolor, this.toggleon});

//   String applianceName;
//   Function onPress;
//   Color connectcolor;
//   bool toggleon;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         child: Card(
//           child: Row(
//             children: <Widget>[
//               Icon(
//                 FontAwesomeIcons.circle,
//                 size: 30.0,
//                 color: connectcolor,
//               ),
//               SizedBox(
//                 width: 20.0,
//                 height: 0.0,
//               ),
//               Text(
//                 '$applianceName',
//                 style: knamingtextstyle,
//               ),
//               SizedBox(
//                 width: 40.0,
//                 height: 0.0,
//               ),
//               Switch(value: toggleon, onChanged: (bool value){ })
//             ],
//           ),
//         ),
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: Color(0xFF1D1E33),
//         ),
//       ),
//     );
//   }
// }
