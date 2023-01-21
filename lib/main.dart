import 'package:destini_game/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'story_brain.dart';

//TODO: Step 15 - Run the app and see if you can see the screen update with the first story. Delete this TODO if it looks as you expected.

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain a = StoryBrain();
//TODO: Step 9 - Create a new storyBrain object from the StoryBrain class.

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // ignore: prefer_const_constructors
            image: NetworkImage(
                'https://i.pinimg.com/originals/b6/d5/08/b6d508e2ce180b346073fe936ea73a25.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Marquee(
                  text: a.getStoryTitle() ?? "default",
                  //TODO: Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                  style: TextStyle(
                    fontSize: 25.0,
                  ),

                  fadingEdgeStartFraction: 0.2,
                  fadingEdgeEndFraction: 0.2,
                  blankSpace: 50,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            a.nextStory(1);
                          });

                          //Choice 1 made by user.
                          //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                        },
                        child: Text(
                          //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                          a.getChoice1() ?? "default",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      flex: 2,
                      //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                      //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                      child: Visibility(
                        visible: a.buttonShouldBeVisible(),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              a.nextStory(2);
                            });
                            //Choice 2 made by user.
                            //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                          },
                          child: Text(
                            //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                            a.getChoice2() ?? "default",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
