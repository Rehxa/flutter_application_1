import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.grey[300],

        body: Column(
          // YOUR CODE
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Container(width: 50, color: Colors.blue),

                  Container(width: 100, color: Colors.yellow),

                  Expanded(child: Container(color: Colors.blue)),

                  Container(width: 100, color: Colors.yellow),

                  Container(width: 50, height: 50, color: Colors.blue),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(width: 60, height: 60, color: Colors.white),

                          Container(width: 60, height: 60, color: Colors.white),

                          Container(width: 60, height: 60, color: Colors.white),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(flex: 3, child: Container(color: Colors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
