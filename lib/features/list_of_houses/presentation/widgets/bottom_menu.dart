import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 30,
      child: const Center(
        child: ColoredBox(
          color: Colors.white,
          child: SizedBox(
            height: 5,
            width: 135,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
                 borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
          
            ),
          ),
        ),
      ),
    );
  }
}
