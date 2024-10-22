# Redux Code Generators for Actions, Middleware, and Reducers in Flutter

This repository contains custom code generators for simplifying the creation of actions, middleware, and reducers in a Redux-based Flutter project. These generators automate the boilerplate code required for state management, helping developers focus more on logic and less on repetitive code.

## Features

- **Action Generator**: Automatically generates Redux actions based on your specifications.
- **Middleware Generator**: Streamlines the creation of middleware for intercepting actions and handling side effects.
- **Reducer Generator**: Simplifies the process of writing reducers that handle state transitions based on different actions.
- **Integration with Flutter**: Fully compatible with Flutter projects using Redux for state management.
- **Annotations Support**: Utilize annotations to control the generation process.
  
## Prerequisites

Before using this package, ensure you have the following set up:

- Flutter SDK
- Redux package for Flutter
- `build_runner` for running code generation
- `source_gen` for generating the code

## Installation

1. Add the following dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  redux:
  build_runner:
  source_gen:

dev_dependencies:
  redux_generators:
```
2. Install the dependencies:

```bash
flutter pub run build_runner build
```
## Usage

1. Action Generator
  
