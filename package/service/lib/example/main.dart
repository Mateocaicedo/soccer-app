import 'package:service/service.dart';

void main()async {
  final service = Service();
  final listLeagues =  await service.getTeams();
  for (final element in listLeagues) {
    print("Team ${element.teamName}");
    for (final i in element.players) {
      print(i.playerName);
    }
  }
}