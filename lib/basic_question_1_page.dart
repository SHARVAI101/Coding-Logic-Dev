import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fdottedline/fdottedline.dart';

class BasicQuestion1 extends StatefulWidget {
  @override
  _BasicQuestion1State createState() => _BasicQuestion1State();
}

class _BasicQuestion1State extends State<BasicQuestion1> {

  var blanks = [[1, 0, -1],[3, 0, -1],[4, 0, -1],[0, 0, -1],[2, 0, -1]]; // 0: Correct answer index from options, 1: 0=not filled 1=filled, 2: index of what is currently filled in this blank

  var options = [["5", 0],["int", 0],[";", 0],["x", 0],["=", 0]]; // 0: Answer text, 1: 1=selected 0=not selected

  var currentblank = 0;

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
              "Declaring Variables",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 30,
              ),
            ),
            Text(
              "Variables are the data carriers in a program. Try declaring an integer variable x and give it a value of 5.",
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
                    children: blanks.map((thisblank){
                      if(thisblank[1]==0){
                         // if it is empty
                        return FDottedLine(
                          color: (currentblank==blanks.indexOf(thisblank))?Colors.green:Colors.black,
                          strokeWidth: 1.5,
                          dottedLength: 6.0,
                          space: 3.0,
                          corner: FDottedLineCorner.all(6.0),
                          height: 40,
                          width: 55,
                          /// add widget
                          // child:
                        );
                      }
                      else{
                        return FDottedLine(
                          color: Colors.black,
                          strokeWidth: 1.5,
                          dottedLength: 6.0,
                          space: 3.0,
                          corner: FDottedLineCorner.all(6.0),
                          height: 40,
                          width: 55,
                          /// add widget
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 30,
                              width: 45,
                              child: RaisedButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  if(currentblank >= 0){
                                    blanks[blanks.indexOf(thisblank)][1]=0; // not filled
                                    options[blanks[blanks.indexOf(thisblank)][2]][1] = 0; // this option is not selected

                                    for(var i=0; i<blanks.length;i++){
                                      if(blanks[i][1]==0){
                                        currentblank = i;
                                        break;
                                      }
                                    }
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

                    }).toList(),
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
                                for(var i=0; i<blanks.length;i++){
                                  if(blanks[i][1]==0){
                                    currentblank = i;
                                    break;
                                  }
                                }

                                options[options.indexOf(thisoption)][1]=1;
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
                    onPressed: (){
                      var _isCorrect = true;
                      for(var i=0; i<blanks.length;i++){
                        if(blanks[i][0]!=blanks[i][2]){
                          _isCorrect=false;
                          break;
                        }
                      }
                      if(_isCorrect==true){
                        print("Correct Answer");
                      }
                      else{
                        print("Wrong Answer");
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