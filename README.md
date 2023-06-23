# Flutter go_router 8.0.3 navigation

### This code contains navigation with:

- AuthStateRouter => Cubit (simulates authentication process)
- go_routers **redirect** listener is unusable because of hot reload, therefor I have replaced it with a BLoC/Cubit listener. Plugin: https://pub.dev/packages/flutter_bloc
- **ShellRoute** for nested navigation within the BottomNavBar

Don't bother doing it from scratch, copy the code instead! <3

**The Navigation Stack:**

- Splash Page
- OnBoarding Page
- SignIn Page
- BottomNavBar
  - Home
    - ReadStory Page
  - Discover
  - Shop
- Account
