abstract class StateTestCon {
  const StateTestCon();
}

class TestInitial extends StateTestCon {}

class TestStateSuccess extends StateTestCon {
  const TestStateSuccess();
}

class TestStateFailed extends StateTestCon {
  const TestStateFailed();
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

 
