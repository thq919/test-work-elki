import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_bloc.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_events.dart';

class TopFilterMenu extends StatefulWidget {
  const TopFilterMenu({Key? key}) : super(key: key);

  @override
  State<TopFilterMenu> createState() => _TopFilterMenuState();
}

const Set<MaterialState> _interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
  MaterialState.selected,
};

int _selectedButton = 0;

class _TopFilterMenuState extends State<TopFilterMenu> {
  
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14.0, left: 16, top: 4),
        child: Wrap(
          spacing: 8,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 1;
                  BlocProvider.of<MainScreenBlock>(context).add(MainScreenILoveClickButtonsJustForFunReturnBackPlease());
                });
              },
              style: getButtonStyleMainScreen(1),
              child: Text('все дома', style: GoogleFonts.roboto(
                                  fontSize: 14)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 2;
                  BlocProvider.of<MainScreenBlock>(context).add(MainScreenOFrameSort());
                });
              },
              style: getButtonStyleMainScreen(2),
              child: Text('О-frame', style: GoogleFonts.roboto(
                                  fontSize: 14)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 3;
                  BlocProvider.of<MainScreenBlock>(context).add(MainScreenAFrameSort());
                });
              },
              style: getButtonStyleMainScreen(3),
              child: Text('A-frame', style: GoogleFonts.roboto(
                                  fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }
}

ButtonStyle getButtonStyleMainScreen(int? selected) {
  return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.any(_interactiveStates.contains)) {
          return Colors.white;
        } else if (selected == _selectedButton) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.any(_interactiveStates.contains)) {
          return const Color.fromRGBO(116, 109, 247, 1);
        } else if (selected == _selectedButton) {
          return const Color.fromRGBO(116, 109, 247, 1);
        } else {
          return const Color.fromRGBO(237, 237, 237, 1);
        }
      }),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(19.0),
      )));
}
