import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'button.dart';

class myhome extends StatefulWidget {
  const myhome({Key? key}) : super(key: key);

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  String inputuser = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        inputuser.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(
                        answer.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        button(
                          numb: "AC",
                          press: () {
                            inputuser = '';
                            answer = "";

                            setState(() {});
                          },
                        ),
                        button(
                          numb: "+/-",
                          press: () {
                            inputuser += '+/-';

                            setState(() {});
                          },
                        ),
                        button(
                          numb: "%",
                          press: () {
                            inputuser += '%';

                            setState(() {});
                          },
                        ),
                        button(
                          numb: "/",
                          press: () {
                            inputuser += '/';

                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        button(
                          numb: "7",
                          press: () {
                            inputuser += '7';
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "8",
                          press: () {
                            inputuser += '8';
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "9",
                          press: () {
                            inputuser += '9';
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "x",
                          color: Colors.orange,
                          press: () {
                            inputuser += 'X';

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        button(
                          numb: "4",
                          press: () {
                            inputuser += '4';
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "5",
                          press: () {
                            inputuser += '5';
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "6",
                          press: () {
                            inputuser += "6";
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "-",
                          press: () {
                            inputuser += '-';

                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      button(
                        numb: "1",
                        press: () {
                          inputuser += '1';
                          ans();
                          setState(() {});
                        },
                      ),
                      button(
                        numb: "2",
                        press: () {
                          inputuser += '2';
                          ans();
                          setState(() {
                            ans();
                          });
                        },
                      ),
                      button(
                        numb: "3",
                        press: () {
                          inputuser += '3';
                          ans();
                          setState(() {
                            ans();
                          });
                        },
                      ),
                      button(
                        numb: "+",
                        press: () {
                          inputuser += '+';

                          setState(() {});
                        },
                        color: Colors.orange,
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        button(
                          numb: "0",
                          press: () {
                            inputuser += '0';
                            ans();
                            setState(() {});
                          },
                        ),
                        button(
                          numb: ".",
                          press: () {
                            inputuser += '.';
                            setState(() {});
                          },
                        ),
                        button(
                          numb: "DELL",
                          press: () {
                            inputuser =
                                inputuser.substring(0, inputuser.length - 1);
                            setState(() {
                              ans();
                            });
                          },
                        ),
                        button(
                          numb: "=",
                          press: () {
                            inputuser = answer;
                            answer = "";

                            setState(() {});
                          },
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void ans() {
    final finaluser = inputuser.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluser);
    ContextModel context = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, context);
    answer = eval.toString();
  }
}
