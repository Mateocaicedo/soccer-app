import 'package:flutter/material.dart';
import 'package:repository/src/models/fixtures.dart';
import 'package:soccer_app/resources/colors.dart';


//create a card that shows the fixtures
class FixtureCard extends StatelessWidget {
  final Fixtures fixture;

  const FixtureCard({Key? key, required this.fixture}) : super(key: key);

  //set the status of the fixture 
  setStatus(){
    
    switch(fixture.eventStatus){

      case "":
        return fixture.eventTime;
      case "Finished":
        return "Full time";
      default:
        return fixture.eventStatus;
    }

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
            //alignment: AlignmentDirectional.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
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
                                      image: NetworkImage(fixture.homeTeamLogo),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: ShapeDecoration(
                                  shape: const CircleBorder(),
                                  image: DecorationImage(
                                      image: NetworkImage(fixture.awayTeamLogo),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  fixture.eventHomeTeam.length > 21 ? '${fixture.eventHomeTeam.substring(0, 19)}...' : fixture.eventHomeTeam,
                                  style: const TextStyle(
                                      fontSize: 15),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  fixture.eventAwayTeam. length > 21 ? '${fixture.eventAwayTeam.substring(0, 19)}...' : fixture.eventAwayTeam,
                                  style: const TextStyle(
                                    
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.justify,
                                  
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                fixture.eventFinalResult
                                    .split("-")
                                    .elementAt(0),
                                style: const TextStyle(
                                     fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                fixture.eventFinalResult
                                    .split("-")
                                    .elementAt(1)
                                    .replaceFirst(" ", ""),
                                style: const TextStyle(
                                     fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),

                        Container(
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                    fixture.eventDate
                                        .toString()
                                        .substring(0, 10),
                                    style: const TextStyle(
                                         fontSize: 15)),
                                Text(
                                  setStatus(),
                                    style: const TextStyle(
                                        fontSize: 15)),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );

  }

}
