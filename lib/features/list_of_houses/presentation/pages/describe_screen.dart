import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_bloc.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_states.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/widgets/bottom_menu.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/widgets/bottom_menu_describe.dart';

class DescribeScreen extends StatefulWidget {
  const DescribeScreen({super.key});

  @override
  State<DescribeScreen> createState() => _DescribeScreenState();
}

class _DescribeScreenState extends State<DescribeScreen> {
  int controllableIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 22,
        primary: false,
      ),
      bottomNavigationBar: BlocBuilder<MainScreenBlock, MainScreenState>(
        builder: ((context, state) {
          if (state is DescribeItemInProgress && state.entity != null) {
            return BottomMenuDescribe(price: state.entity!.price.toInt());
          } else {
            return BottomMenu();
          }
        }),
      ),
      body: BlocBuilder<MainScreenBlock, MainScreenState>(
          builder: (context, state) {
        if (state is DescribeItemInProgress && state.entity != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text(state.entity!.type.toString(),
                        style: GoogleFonts.roboto(
                            fontSize: 19, fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(state.entity!.name,
                          style: GoogleFonts.roboto(
                              fontSize: 19,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700)),
                    )
                  ],
                ),
              ),
              if (state.entity != null &&
                  state.entity?.images != null &&
                  state.entity!.images!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          height: MediaQuery.of(context).size.height /
                              2.74324324324),
                      itemCount: state.entity!.images!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              state.entity!.images!.elementAt(itemIndex),
                              fit: BoxFit.fill,
                            ));
                      }),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(state.entity!.description,
                    style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              )
            ],
          );
        } else if (state is LoadingState) {
          return const Placeholder();
        } else {
          return const Text('');
        }
      }),
    );
  }
}
