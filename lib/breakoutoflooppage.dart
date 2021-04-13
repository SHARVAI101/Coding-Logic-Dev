import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BreakOutOfLoop extends StatefulWidget {
  @override
  _BreakOutOfLoopState createState() => _BreakOutOfLoopState();
}

class _BreakOutOfLoopState extends State<BreakOutOfLoop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              "Stopping Loops",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 30,
              ),
            ),
            Text(
              "Sometimes we need to stop the execution of loops when some condition is achieved. See if you can figure out how to do it.",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 15,
              ),
            ),
            Flexible(
              child: ListView(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: 200),
                  Text('Actual question with blanks etc')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Options to rearrange"
              ),
            )
          ],
        ),
      ),
    );
  }
}
