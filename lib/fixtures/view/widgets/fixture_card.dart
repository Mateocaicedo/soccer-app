import 'package:flutter/material.dart';
import 'package:repository/src/models/fixtures.dart';

class FixtureCard extends StatelessWidget {
  final Fixtures fixture;
  
  const FixtureCard({Key? key, required this.fixture}) : super(key: key);


  
  String scoreboard(Fixtures fixtureb) {
    String score = "";
    if (fixtureb.eventStatus == "") {
      
       score = "";
    } else {
      if (fixtureb.eventStatus == "Finished" || fixtureb.eventStatus == "Postponed") {
        
        return fixtureb.eventFinalResult.split(" ").elementAt(0).toString();

      } else {
        
        if (fixtureb.eventStatus == "Half time") {
          
        }
      }
      
    }
    return score;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: const CircleBorder(),
                          image: DecorationImage(
                              image: NetworkImage(
                                  fixture.homeTeamLogo),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: ShapeDecoration(
                          shape: const  CircleBorder(),
                          image: DecorationImage(
                              image: NetworkImage(
                                  fixture.awayTeamLogo),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(fixture.eventHomeTeam, textAlign: TextAlign.start,style: TextStyle(fontFamily: "Poppins", fontSize: 15),),
                      Text(fixture.eventAwayTeam, textAlign: TextAlign.start, style: TextStyle(fontFamily: "Poppins", fontSize: 15)),
                    ],
                  ),



                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      
                      Text(fixture.eventFinalResult.split("-").elementAt(0).toString() , style: const TextStyle(fontFamily: "Poppins", fontSize: 15)),
                      
                      Text(fixture.eventFinalResult.split("-").elementAt(1).toString() , style: const TextStyle(fontFamily: "Poppins", fontSize: 15)),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                      width: 85,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          Text(fixture.eventDate.toString().substring(0,10), style: TextStyle(fontFamily: "Poppins", fontSize: 15)),
                          Text(fixture.eventStatus == "Finished" ? "" : "${fixture.eventStatus}'", style: TextStyle(fontFamily: "Poppins", fontSize: 15)),
                        ],
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
