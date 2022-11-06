import 'package:service/service.dart';

void main()async {
  final service = Service();
  final fixtures =  await service.getFixtures();
  for (final element in fixtures) {
    print(element.eventStadium);
  }
}