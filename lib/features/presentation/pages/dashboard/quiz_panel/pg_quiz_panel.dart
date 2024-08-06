import 'package:comptia/core/app_settings/constants/app_dim.dart';
import 'package:comptia/core/app_settings/theme/app_colors.dart';
import 'package:comptia/features/presentation/cubits/question_prog/cubit_question_prog.dart';
import 'package:comptia/features/presentation/cubits/question_prog/state_question_prog.dart';
import 'package:comptia/features/presentation/cubits/quiz_timer/cubit_quiz_timer.dart';
import 'package:comptia/features/presentation/pages/dashboard/quiz_panel/quiz_panel_widgets.dart'; 
import 'package:comptia/features/presentation/widgets/label.dart';
import 'package:comptia/features/presentation/widgets/widget_global_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/timer_bloc.dart';
import '../../../blocs/timer_event.dart';
import '../../../blocs/timer_state.dart';
import '../../../widgets/explanation_box.dart'; 

class PgQuizPanel extends StatelessWidget {
  const PgQuizPanel({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedOption = 1;
    return PopScope(
      canPop: true,
      onPopInvoked: (value) {
        BlocProvider.of<CubitQuizTimer>(context).closeTimer();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.cancel,
                  color: AppColors.primary,
                ))
          ],
          title: const Label(
            txt: "20 random Question",
            type: TextTypes.f_18_500,
          ),
        ),
        body: SafeArea(
          child: WidgetGlobalMargin(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                padVertical(30),
                quizPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded quizPanel() {
    return Expanded(
              child: PageView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           quizCanvas(),
                          padVertical(40),
                          const Label(
                              txt: "Explanation", type: TextTypes.f_14_450),
                          padVertical(5),
                          const ExplanationBox(hintTxt: "Explain",),
                          padVertical(40),
                          quizFooter(context),
                          padVertical(20)
                        ],
                      ),
                    );
                  }),
            );
  }
  
  Container quizCanvas() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
          )),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Label(txt: "01", type: TextTypes.f_14_450),
                    Label(txt: "20", type: TextTypes.f_14_450)
                  ],
                ),
                padVertical(10),
                BlocBuilder<CubitQuestionProgress,StateQuestionProgress>(builder: (context , state){
var prog = 0.01;
if(state is StateQuestionProgressForward){
  prog = state.progress;
}
if (state is StateQuestionProgressEnd){
  prog = 1;
}
return  widgetProgressIndicator(prog);
                })
               ,
                padVertical(30),
    //             BlocProvider(
    //   create: (_) => TimerBloc(ticker: Ticker()),
    //   child:Column(
    //     children: [
    //       TimerText(),
    //       Actions(),
    //     ],
    //   ) //const TimerView(),
    // ),
     widgetTimer("02:50"),
//                   BlocBuilder<CubitQuizTimer,StateQuizTimer>(builder: (context , state){
// var currentTime = "00:01";
// if(state is StateQuizTimerInit){
//   BlocProvider.of<CubitQuizTimer>(context).startTime();
// }
// if (state is StateQuizTimerNow){
//   currentTime = state.timeTick;//.currentTime.toString();
// }
// return   widgetTimer(currentTime);
//                 }),
               
                padVertical(30),

                widgetQuestion(),
                padVertical(10),
                Divider(
                  color: Colors.grey.shade500,
                ),
                //  padVertical(10),
                ListView.builder(
                    itemCount: 1,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return widgetOption(isSelected: false);
                    }),

              //  widgetOption(isSelected: true),
                // radioButton(false)  ,
              ],
            ),
          ],
        ),
      ),
    );
  

  
  }

  

  
}


class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}



class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  FloatingActionButton(
                    child: const Icon(Icons.play_arrow),
                    onPressed: () => context
                        .read<TimerBloc>()
                        .add(TimerStarted(duration: state.duration)),
                  ),
                ],
              TimerRunInProgress() => [
                  FloatingActionButton(
                    child: const Icon(Icons.pause),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerPaused()),
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
              TimerRunPause() => [
                  FloatingActionButton(
                    child: const Icon(Icons.play_arrow),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerResumed()),
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
              TimerRunComplete() => [
                  FloatingActionButton(
                    child: const Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ]
            }
          ],
        );
      },
    );
  }
}