// import 'package:redux_annotations/redux_annotations.dart';
// import 'package:redux/redux.dart';
// part 'middleware.g.dart';

// @ReduxMiddleware('function discription')
// void getBidIncrement() {
//   print('hello, world');
// }
import 'package:examble/action2.dart';
import 'package:flutter/material.dart';
// import 'package:monetarium/repo/repository.dart';
// ignore: depend_on_referenced_packages
import 'package:redux/redux.dart';
import 'package:redux_annotations/redux_annotations.dart';

// import '../../repo/model/api_responce.model.dart';
// import '../../utils/routes.dart';
// import '../app.state.dart';
@ReduxMiddleware
Middleware<AppState> signUp(Repository repo) {
  return (Store<AppState> store, action, NextDispatcher dispatch) async {
    dispatch(action);
      try {
        SetAction ac = action as SetAction;

        store.dispatch(SetSuccessAction(isSuccess: true));
      } catch (error) {
  
        dispatch(SetFailedAction(error: error.toString()));
        // print(error);
      }
  };
}

class AppState {
}

class Repository {
}
