// code snippet
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '124621';

  void pressC() {
    setState(() {
      input = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // #view calculate
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.all(1),
              color: Colors.grey.shade800,
              padding: const EdgeInsets.all(15),
              child: Text(
                input,
                style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          // #buttons
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(1),
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        // #button: c
                        MyButtons(
                          onPressed: pressC,
                          name: "C",
                          color: Colors.orange,
                        ),

                        // #button: delete
                        Expanded(
                          flex: 1,
                          child: Container(
                              margin: const EdgeInsets.all(5),
                              color: Colors.white,
                              child: const Center(
                                child: Icon(
                                  Icons.backspace_outlined,
                                  size: 40,
                                  color: Colors.orange,
                                ),
                              )),
                        ),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "%", color: Colors.orange),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "/", color: Colors.orange),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "7", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "8", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "9", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "*", color: Colors.orange),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "7", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "8", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "9", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "*", color: Colors.orange),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "7", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "8", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "9", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "*", color: Colors.orange),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "7", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "8", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "9", color: Colors.black),

                        // #button: c
                        MyButtons(
                            onPressed: () {}, name: "*", color: Colors.orange),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyButtons extends StatelessWidget {
  final void Function() onPressed;
  final String name;
  final Color color;

  const MyButtons(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(5),
          color: Colors.white,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 40,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
