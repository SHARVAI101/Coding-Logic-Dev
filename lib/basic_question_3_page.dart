import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';

class BasicQuestion3 extends StatefulWidget {
  @override
  _BasicQuestion3State createState() => _BasicQuestion3State();
}

class _BasicQuestion3State extends State<BasicQuestion3> {
  var blanks = [[1, 0, -1],[2, 0, -1],[0, 0, -1]]; // 0: Correct answer index from options, 1: 0=not filled 1=filled, 2: index of what is currently filled in this blank

  var options = [["break", 0],["loop start", 0],["if condition is satisfied", 0]]; // 0: Answer text, 1: 1=selected 0=not selected

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
        height: 45,
        width: 65,
        /// add widget
        child: SizedBox(
          height: 45,
          width: 155,
        )
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
            padding: const EdgeInsets.all(7.0),
            child: SizedBox(
              height: 35,
              // width: ,
              child: RaisedButton(
                padding: EdgeInsets.all(10),
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
              "Stopping Loops",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 30,
              ),
            ),
            Text(
              "Start a loop and if a given condition is satisfied, stop the execution of the loop.",
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
                  SizedBox(height: 30),
                  BlankConstruct(blanks[0]),
                  SizedBox(height:10),
                  Text(
                    "{",
                    style: TextStyle( fontSize: 18),
                  ),
                  SizedBox(height:6),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      '// some code inside the loop',
                      style: TextStyle( color:Colors.black, fontSize: 18),
                    ),
                  ),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: BlankConstruct(blanks[1]),
                  ),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      "{",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: BlankConstruct(blanks[2]),
                  ),
                  SizedBox(height:10),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      "}",
                      style: TextStyle( fontSize: 18),
                    ),
                  ),
                  SizedBox(height:10),
                  Text(
                    "}",
                    style: TextStyle( fontSize: 18),
                  ),
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
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("End of Demo"),
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
