#  Redux_Generator

A redux_generator package to simplify managing **Redux** states, actions, and reducers in Dart/Flutter applications. By using annotations, this generator automates the creation of Redux boilerplate code, reducing manual work and ensuring consistency.

## Features

This code generator package provides the following annotations:
- `@ReduxState`: Generates a Redux state class.
- `@ReduxAction`: Generates Redux action classes.
- `@ReduxReducer`: Generates reducer functions that combine actions with state changes.

## Getting Started

### 1. Install the Package

Add `redux_generator` and `redux_annotations`  as dependencies in your `pubspec.yaml`.

```yaml
dependencies:
  redux_annotations: ^1.0.0

dev_dependencies:
  build_runner: ^2.1.0
  redux_generator: ^1.0.0
```

### 2. Define Your State, Actions, and Reducers

#### State Annotation: @ReduxState

Use `@ReduxState` to mark a class as a Redux state.The state class will be automatically generated with copyWith functionality , initial method  and override `toString`, `operator ==`, `hashCode `for easy state updates.

```Dart
import 'package:redux_annotations/redux_annotations.dart';
part 'state.g.dart';

@ReduxState
class SignUpState with _$SignUpState {
  factory SignUpState({
    bool? loading,
    bool? isSignedUp,
    String? error,
  }) = _SignUpState;

  factory SignUpState.initial() => _$SignUpStateInitial();
}
```

#### Action Annotation: @ReduxAction

Use `@ReduxAction` to mark classes as actions. These classes represent actions that can be dispatched in the Redux store.
The Action class will be automatically generated with constructor + properties and override `toString` method.


```Dart
import 'package:redux_annotations/redux_annotations.dart';

part 'action.g.dart';

@ReduxAction
class SetAction with _$SetAction {
  factory SetAction({
    String? name,
    bool? isSuccess,
    double? amount,
    List<IncrementItemModel>? incrementDetails,
  }) = _SetAction;
}

@ReduxAction
class SetSuccessAction with _$SetSuccessAction {
  factory SetSuccessAction({
    bool? isSuccess,
    List<IncrementItemModel>? incrementDetails,
  }) = _SetSuccessAction;
}

@ReduxAction
class SetFailedAction with _$SetFailedAction {
  factory SetFailedAction({
    String? error,
  }) = _SetFailedAction;
}

```

#### Reducer Annotation: @ReduxReducer

Use `@ReduxReducer` to mark a function for generating reducers that handle state transformations in response to actions.Generated code has combine Reducer(combining all reducers respect to yourState).

```Dart
import 'package:examble/action.dart';
import 'package:examble/state.dart';
import 'package:redux_annotations/redux_annotations.dart';
import 'package:redux/redux.dart';
part 'reducer.r.dart';

final signUpStateReducer = _$signUpStateReducer;

@ReduxReducer
SignUpState setLoading(SignUpState state, GetAction action) =>
    state.copyWith(isSignedUp: true);

@ReduxReducer
SignUpState removeWatchlistSuccess(SignUpState state, SuccessAction action) =>
    state.copyWith(isSignedUp: true);

@ReduxReducer
SignUpState removeWatchlistFailed(SignUpState state, FailedAction action) =>
    state.copyWith(isSignedUp: false);
```

### 3. Run the Code Generator

Run the following command to generate the necessary code:

```bash
dart run build_runner build
```

