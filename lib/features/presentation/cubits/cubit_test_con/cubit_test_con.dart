import 'package:comptia/features/domain/usecases/uc_test_con.dart';
import 'package:comptia/features/presentation/cubits/cubit_test_con/state_test_con.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitTest extends Cubit<StateTestCon> {
  final UCTestCon uc;

  CubitTest({required this.uc}) : super(TestInitial());

  Future<void> appStarted() async {
    try {
      final success = uc.btnTestConnection();

      if (success) {
        emit(const TestStateSuccess());
      } else {
        //Here we disabled this in app phase two becasuse of guest mode
        emit(const TestStateFailed());
        //Now
        // emit(const GuestMode());
      }
    } catch (e) {
      emit(const TestStateFailed());
    }
  }

  // void logoutFromTheApp() {
  //   try {
  //     userAuthUseCase.logoutFromTheApp();
  //     emit(UnAuthenticatedState());
  //   } catch (e) {
  //     emit(UnAuthenticatedState());
  //   }
  // }

  // void authenticateUser(
  //     {required String iso,
  //     required int locID,
  //     required String tkn,
  //     required String uID,
  //     required String email}) {
  //   final locData =
  //       CountryDatum(id: locID, name: "", iso: iso, flagIconUrl: "");
  //   userAuthUseCase.savePrimaryLocation(locData);
  //   emit(AuthenticatedState(
  //       iso: iso, sessionToken: tkn, userID: uID, email: email));
  // }

  // bool checkIsUserLogged() {
  //   try {
  //     final isSignInData = userAuthUseCase.checkAuthentication();
  //     onConsole('isSignIn $isSignInData');
  //     if (isSignInData == null) {
  //       return false;
  //     }
  //     return true;
  //     // else{
  //     //   emit(AuthenticatedState(
  //     //       iso: iso, sessionToken: tkn, userID: uID, email: email));
  //     // }
  //   } catch (e) {
  //     // emit(const UnAuthenticatedState());
  //     toast("oops error while checking guest mode");
  //     return false;
  //   }
  // }
}
