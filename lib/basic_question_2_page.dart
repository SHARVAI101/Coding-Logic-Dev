import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:logic_dev_test/basic_question_3_page.dart';

class BasicQuestion2 extends StatefulWidget {
  @override
  _BasicQuestion2State createState() => _BasicQuestion2State();
}

class _BasicQuestion2State extends State<BasicQuestion2> {
  var blanks = [[2, 0, -1],[0, 0, -1],[1, 0, -1]]; // 0: Correct answer index from options, 1: 0=not filled 1=filled, 2: index of what is currently filled in this blank

  var options = [["10", 0],["++", 0],["7", 0]]; // 0: Answer text, 1: 1=selected 0=not selected

  var currentblank = 0;
  var allBlanksFilled = false;

  //this function constructs every blank
  Widget BlankConstruct(thisblank){
    if(thisblank[1]==0){
      // if it is empty
      return FDottedLine(
        color: (currentblank==blanks.indexOf(thisblank))?Colors.green:Colors.black,
        strokeWidth: 1.5,
        dottedLength: 6.0,
        space: 2.0,
        corner: FDottedLineCorner.all(6.0),
        height: 35,
        width: 50,
        /// add widget
        // child:
      );
    }
    else{
      return FDottedLine(
          color: Colors.black,
          strokeWidth: 1.5,
          dottedLength: 6.0,
          space: 2.0,
          corner: FDottedLineCorner.all(6.0),
          height: 40,
          width: 55,
          /// add widget
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 25,
              width: 40,
              child: RaisedButton(
                padding: EdgeInsets.all(0),
                onPressed: (){
                  if(currentblank >= 0){
                    blanks[blanks.indexOf(thisblank)][1]=0; // not filled
                    options[blanks[blanks.indexOf(thisblank)][2]][1] = 0; // this option is not selected
                    blanks[blanks.indexOf(thisblank)][2]=-1; //no option in this blank

                    for(var i=0; i<blanks.length;i++){
                      if(blanks[i][1]==0){
                        currentblank = i;
                        break;
                      }
                    }

                    allBlanksFilled=false;
                    setState(() {

                    });
                  }
                },
                child: Text(
                  options[thisblank[2]][0],

                ),
              ),
            ),
          )
      );
    }
  }

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
              "Running For-Loops",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 30,
              ),
            ),
            Text(
              "Declare a for-loop starting at 7 and ending at 10 which increments once every time.",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              child: ListView(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                children: [
                  // SizedBox(height: 200),
                  // Text('Actual question with blanks etc'),
                  SizedBox(height: 50),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 6,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: RichText(
                          text: TextSpan(
                            text: "for",
                            style: TextStyle( color:Colors.black, fontSize: 18),
                            children: [
                              TextSpan(text: '('),
                              TextSpan(text: 'int', style: TextStyle(color:Colors.black)),
                              TextSpan(text: ' i'),
                              TextSpan(text: '='),
                            ]
                          ),
                        ),
                      ),
                      BlankConstruct(blanks[0]),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: RichText(
                          text: TextSpan(
                              text: ";  i",
                              style: TextStyle( color:Colors.black, fontSize: 18),
                              children: [
                                TextSpan(text: ' <='),
                              ]
                          ),
                        ),
                      ),
                      BlankConstruct(blanks[1]),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          ';  i',
                          style: TextStyle( color:Colors.black, fontSize: 18),
                        ),
                      ),
                      BlankConstruct(blanks[2]),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          ')',
                          style: TextStyle( color:Colors.black, fontSize: 18),
                        ),
                      ),
                    ]
                  ),
                  SizedBox(height: 5),
                  Text(
                    '{',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '       // do something inside the loop',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '}',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choices:',
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 6,
                        children: options.map((thisoption){
                          if(thisoption[1]==1){
                            // if it has been selected
                            return Container();
                          }
                          else{
                            return RaisedButton(
                              onPressed: (){
                                if(currentblank < blanks.length){
                                  blanks[currentblank][1]=1;
                                  blanks[currentblank][2]=options.indexOf(thisoption);
                                  var _prevblank=currentblank;
                                  for(var i=0; i<blanks.length;i++){
                                    if(blanks[i][1]==0){
                                      currentblank = i;
                                      break;
                                    }
                                  }
                                  print(currentblank);
                                  print(blanks.length);

                                  options[options.indexOf(thisoption)][1]=1;

                                  if(currentblank==_prevblank)
                                    allBlanksFilled=true;

                                  setState(() {

                                  });
                                }
                              },
                              child: Text(
                                  thisoption[0]
                              ),
                            );
                          }

                        }).toList(),
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: (MediaQuery. of(context). size. width-60)/2,
                  child: RaisedButton(
                    onPressed: (){},
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text(
                      'Check Theory',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'FreeSans'
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  height: 50,
                  width: (MediaQuery. of(context). size. width-60)/2,
                  child: RaisedButton(
                    onPressed: (allBlanksFilled==false)?null:(){
                      var _isCorrect = true;
                      for(var i=0; i<blanks.length;i++){
                        if(blanks[i][0]!=blanks[i][2]){
                          _isCorrect=false;
                          break;
                        }
                      }
                      if(_isCorrect==true){
                        print("Correct Answer");
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              "Correct Answer",
                              textAlign: TextAlign.center,
                            ),
                            // content: Text("You have raised a Alert Dialog Box"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => BasicQuestion3()),
                                  );
                                },
                                child: Text("Continue"),
                              ),
                            ],
                          ),
                        );
                      }
                      else{
                        print("Wrong Answer");
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text("Wrong Answer"),
                            content: Text("Try 'Check Theory' to understand get hints."),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Retry"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 15,),
                        Text(
                          'RUN',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'FreeSans'
                          ),
                        ),
                        Icon(
                            Icons.play_arrow
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
