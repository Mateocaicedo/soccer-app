import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/bloc/dropdown_bloc.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownBloc,String>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            context.read<DropdownBloc>().add(OnChanged(newValue!));
            
          },
          items: <String>['Premier League', 'La Liga', 'Serie A', 'Bundesliga', 'Liga BetPlay', 'World Cup']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
