abstract class StateQuestionProgress {
  const StateQuestionProgress();
}

class StateQuestionProgressInit extends StateQuestionProgress {}

class StateQuestionProgressForward extends StateQuestionProgress {
   final double progress;

  StateQuestionProgressForward({required this.progress});
 
}

class StateQuestionProgressBackward extends StateQuestionProgress {
  final double progress;

  StateQuestionProgressBackward({required this.progress});
 // const TestStateFailed();
}
class StateQuestionProgressEnd extends StateQuestionProgress {
 // const TestStateFailed();
}
class StateQuestionProgressStart extends StateQuestionProgress {
 // const TestStateFailed();
}

// class UnAuthenticatedState extends AuthState {}

// abstract class AuthState {
//   const AuthState();
// }

// class AuthInitial extends AuthState {}

// class AuthenticatedState extends AuthState {
//   final String iso;
//   final String sessionToken;
//   final String userID;
//   final String email;
//   const AuthenticatedState(
//       {required this.iso,
//       required this.sessionToken,
//       required this.userID,
//       required this.email});
// }
 
// class GuestMode extends AuthState {

//   const GuestMode(
//        );
// }

// class UnAuthenticatedState extends AuthState {}

 
