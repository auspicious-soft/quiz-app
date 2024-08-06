import 'dart:async';
import 'dart:core';  
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'state_quiz_timer.dart';

class CubitQuizTimer extends Cubit<StateQuizTimer> {
  
 
  CubitQuizTimer( ) :  super(StateQuizTimerInit()) ;
double currentProgress = 0.01;
Timer? assignedTimer;
  Future<void> startTime() async {
    try {
      if(assignedTimer != null){
        assignedTimer = null;
      }
     assignedTimer =   Timer.periodic(
  const Duration(seconds: 1),
  (timer) {
    // Update user about remaining time
   // print("Time ${timer.tick}");
   
     final duration =  timer.tick;//Duration(seconds:  timer.tick);

     //final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    
   // var zero = "0";

//final userTime = "0${clockTimer.inMinutes}:${(clockTimer.inSeconds < 10) ? "0" : ""}${clockTimer.inSeconds}";
     emit(StateQuizTimerNow(timeTick: "$minutesStr:$secondsStr"));
  },
);
      // await  Future.delayed(Duration.zero);
       
    //emit(StateQuizTimerNow(currentTime: currentProgress));
     
    } catch (e) {
      currentProgress = 0.01;
    await  Future.delayed(Duration.zero);
    emit(StateQuizTimerException(reason: e.toString()));
    }
  }

  Future<void> closeTimer() async {
    assignedTimer?.cancel();
     emit(StateQuizTimerNow(timeTick: "00:00"));
     //emit(StateQuizTimerClosed());
    // close();
  }

  void resetState() {
    emit(StateQuizTimerInit());
  }

   
}

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}



//part of 'timer_bloc.dart';
