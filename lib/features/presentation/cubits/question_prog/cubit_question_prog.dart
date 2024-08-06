import 'package:comptia/features/presentation/cubits/question_prog/state_question_prog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/uc_quiz_panel.dart';

class CubitQuestionProgress extends Cubit<StateQuestionProgress> {
  final UCQuizPanel _uc;
 
  CubitQuestionProgress({required UCQuizPanel uc}) :  _uc = uc , super(StateQuestionProgressInit()) ;
double currentProgress = 0.01;
  Future<void> forward() async {
    try {
       currentProgress = currentProgress + 0.01;
       await  Future.delayed(Duration.zero);
       if(currentProgress > 0.99){
 emit(StateQuestionProgressEnd());
       }
    
    emit(StateQuestionProgressForward(progress: currentProgress));
     
    } catch (e) {
      currentProgress = 0.01;
    await  Future.delayed(Duration.zero);
    emit(StateQuestionProgressForward(progress: currentProgress));
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
