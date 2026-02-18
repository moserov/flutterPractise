# Flutter Roadmap: React-to-Dart Transition

This repo is a technical log of my 5-day sprint moving from a React Fullstack/Lead background into the Flutter ecosystem. Instead of a "Hello World," I built this to test how Clean Architecture and the BLoC pattern handle real-world state logic.

## 🏗 Why this structure?
I've organized the project into **Data, Domain, and Presentation** layers.
- **Domain:** Pure Dart entities and models. No dependencies on Flutter.
- **Data:** Repository pattern for data abstraction. If we swap a REST API for Firebase or an offline SQLite DB tomorrow, the rest of the app doesn't break.
- **Presentation:** Split into `pages` and `bloc`. Widgets are kept "dumb," only reacting to states emitted by the BLoC.

## 🧠 State Management: BLoC
Coming from Redux, I opted for **BLoC (Business Logic Component)** because it provides a strict unidirectional data flow. 
- **Events -> BLoC -> States.** - I used `Equatable` to ensure value-based equality, preventing unnecessary UI repaints and keeping the app performant.

## 🚀 The 5-Day Progression
* **Day 1:** Type safety, Null Safety, and Widget lifecycle (`initState` vs `build`).
* **Day 2:** The Layout Engine. Mastering "Constraints go down, Sizes go up."
* **Day 3:** Async logic. Handling `FutureBuilder` states (Loading/Error/Success) via repositories.
* **Day 4:** BLoC Implementation. Migrating from local state to a formal state machine.
* **Day 5:** Dependency Injection principles and Architecture cleanup.


## 🏁 Getting it Running
1. `flutter pub get`
2. `flutter run`

Check out `lib/presentation/bloc/post_bloc.dart` to see the core logic.