import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_bloc.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_events.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_states.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/widgets/bottom_menu.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/widgets/single_home.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/widgets/top_filter_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainScreenBlock bloc = BlocProvider.of<MainScreenBlock>(context);
    return Scaffold(
      bottomNavigationBar: const BottomMenu(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        toolbarHeight: 22,
        primary: false,
      ),
      body: BlocBuilder<MainScreenBlock, MainScreenState>(
          builder: (context, state) {
        if (state is LoadingState || state is DescribeItemInProgress) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        } else if (state is LoadingCompleteSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopFilterMenu(),
              Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.mainScreenHomes!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          bloc.add(MainScreenNeedToShowDescribe(index));
                          await Navigator.of(context)
                              .pushNamed('/describe')
                              .then((value) => bloc.add(MainScreenLoadEvent()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child:
                              SingleHome(entity: state.mainScreenHomes![index]),
                        ),
                      );
                    }),
              ),
            ],
          );
        } else {
          return const Text(
              '''Если вы видите это сообщение, то оно предназначается вам.
              Возможно произошла ошибка, возможно вы обнаружили её просто в коде. 
              В любом случае - я с удовольствием приму вашу обьективную оценку.
              После ревью этого кода, сделайте крепкую чашечку кофе/чая и
              насладитесь прекрасным видеоклипом: https://www.youtube.com/watch?v=dQw4w9WgXcQ
              и хорошего вам дня, уважаемый работадатель. Благодарю за внимание.''');
        }
      }),
    );
  }
}
