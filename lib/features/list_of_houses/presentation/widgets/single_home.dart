import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_work_elki/features/list_of_houses/domain/entitys/house_entity.dart';

class SingleHome extends StatelessWidget {
  final HouseEntity entity;
  const SingleHome({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.087),
          spreadRadius: -3,
          blurRadius: 12,
          offset: const Offset(0, 6),
          // changes position of shadow
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width / 1.03021978022),
              height: (MediaQuery.of(context).size.height / 3.07575757576),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: entity.images != null &&
                                entity.images!.isNotEmpty
                            ? NetworkImage(
                                entity.images!.first,
                              )
                            : const NetworkImage(
                                '''https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg'''))),
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 1.03021978022),
              height: (MediaQuery.of(context).size.height / 8.42727272727),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, top: 16, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            entity.name,
                            style: GoogleFonts.roboto(
                                fontSize: 19, color: Colors.black),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            entity.type,
                            style: GoogleFonts.roboto(
                                fontSize: 19,
                                color: const Color.fromRGBO(136, 136, 136, 1)),
                          ),
                        ],
                      ),
                    ),

                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: RatingBar.builder(
                                itemSize: 12,
                                initialRating: entity.rating.toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Color.fromRGBO(116, 109, 247, 1),
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text('(${entity.review_count}) отзывов',
                                  style: GoogleFonts.roboto(
                                      fontSize: 10, color: Colors.black)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: Row(
                            children: [
                              Text('${entity.price}₽',
                                  style: GoogleFonts.roboto(
                                      fontSize: 19, color: Colors.black)),
                              Text('/сут.',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14, color: Colors.black))
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
