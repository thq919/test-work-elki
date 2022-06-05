import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomMenuDescribe extends StatelessWidget {
  const BottomMenuDescribe({Key? key, required this.price}) : super(key: key);
  final int price;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.087),
          spreadRadius: -3,
          blurRadius: 12,
          offset: const Offset(0, -7),
          // changes position of shadow
        ),
      ]),
      child: Wrap(
        children: [
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: 92,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text('$price ₽',
                          style: GoogleFonts.roboto(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.w700)),
                    ),
                    Text('/сут.',
                        style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.88227848101,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(116, 109, 247, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(19.0),
                            ))),
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/');
                        },
                        child: Text(
                          'Назад',
                          style: GoogleFonts.roboto(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
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
            ),
          ),
        ],
      ),
    );
  }
}
