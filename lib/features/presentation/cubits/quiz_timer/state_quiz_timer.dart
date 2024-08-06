abstract class StateQuizTimer {
  const StateQuizTimer();
}

class StateQuizTimerInit extends StateQuizTimer {}

class StateQuizTimerAppResumed extends StateQuizTimer {
   final double lastTime;

  StateQuizTimerAppResumed ({required this.lastTime});
 
}
class StateQuizTimerNow extends StateQuizTimer {
   final String timeTick;

  StateQuizTimerNow ({required this.timeTick});
 
}
class StateQuizTimerAppPaused extends StateQuizTimer {
  final double currentTime;

  StateQuizTimerAppPaused({required this.currentTime});
 // const TestStateFailed();
}

class StateQuizTimerClosed extends StateQuizTimer {
  

  StateQuizTimerClosed();
 // const TestStateFailed();
}
class StateQuizTimerException extends StateQuizTimer {
final String reason;

  StateQuizTimerException({required this.reason});
}
  