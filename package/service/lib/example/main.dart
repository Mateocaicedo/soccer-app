import 'package:service/service.dart';

void main()async {
  final service = Service();
  final listLeagues =  await service.getLeagues();
  for (final element in listLeagues) {
    print(element.countryLogo);
  }
}