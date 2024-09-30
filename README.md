# flutter_assignment
## Interview Assignment: Multi-Module Flutter Application Development

This project includes a multi-module Flutter application where different features exist in
separate modules, and the navigation between screens in different feature modules is handled
using GoRouter.

## Features/Modules

- Auth Module : 
> This module allow users to sing up and login users with email and passwords.
> Authentication process is powered by [supabase_flutter]
> This module is divided into three layer: Domain , data layer and presentation layer 
> State Management is powered by [bloc]


- Main navigation screen/Bottom Nav Bar
> After Success of login, the app navigates to the main navigation screen, Main navigation screen contains a bottom bar
> Bottom bar contains two tabs (Home and settings), Home (default) naviagate to dashboard screen and settings tab navigate to settings to settings page.
> Navigation is powered by [go_router].

- Dashboard: 
> This module show some fake statistics data.
> This module is divided into three layer: Domain , data layer and presentation layer
> State Management is powered by bloc

- Settings
> This module allow users change the theme of the app, by default theme is set to [dark]. User can toggle the switch to change the theme.
> State Management is powered by bloc

- Bonus:
> This app leverages the power of dependencies injection by using [get_it]


## Folder Structure of the Application:

├── lib
│   ├── core
│   │   ├── common
│   │   │   └── widgets
│   │   │       ├── dots_loader.dart
│   │   │       ├── padding_ext.dart
│   │   │       └── snackbar.dart
│   │   ├── di
│   │   │   └── di.dart
│   │   ├── error
│   │   │   ├── exception.dart
│   │   │   └── faliures.dart
│   │   ├── router
│   │   │   └── router.dart
│   │   ├── supabase_utils
│   │   │   └── supabase_utils.dart
│   │   ├── theme
│   │   │   ├── app_colors.dart
│   │   │   └── app_theme.dart
│   │   └── usecase
│   │       └── usecase.dart
│   ├── features
│   │   ├── auth
│   │   │   ├── data
│   │   │   │   ├── datasource
│   │   │   │   │   └── auth_remote_data_source.dart
│   │   │   │   ├── model
│   │   │   │   │   └── user_model.dart
│   │   │   │   └── repositry
│   │   │   │       └── auth_repository_impl.dart
│   │   │   ├── domain
│   │   │   │   ├── enitity
│   │   │   │   │   └── user.dart
│   │   │   │   ├── repository
│   │   │   │   │   └── auth_repository.dart
│   │   │   │   └── usecase
│   │   │   │       ├── user_login.dart
│   │   │   │       └── user_sign_up.dart
│   │   │   └── presentaion
│   │   │       ├── bloc
│   │   │       │   ├── auth_bloc.dart
│   │   │       │   ├── auth_event.dart
│   │   │       │   └── auth_state.dart
│   │   │       ├── pages
│   │   │       │   ├── login_page.dart
│   │   │       │   └── signup_page.dart
│   │   │       └── widgets
│   │   │           └── auth_text_field.dart
│   │   ├── dashboard
│   │   │   ├── data
│   │   │   │   ├── datasource
│   │   │   │   │   └── fake_data_source.dart
│   │   │   │   ├── model
│   │   │   │   │   └── statistics_model.dart
│   │   │   │   └── repository
│   │   │   │       └── statistics_repository_impl.dart
│   │   │   ├── domain
│   │   │   │   ├── entity
│   │   │   │   │   └── statistics.dart
│   │   │   │   ├── repository
│   │   │   │   │   └── statistics_repository.dart
│   │   │   │   └── usecase
│   │   │   │       └── get_statistics.dart
│   │   │   └── presentation
│   │   │       ├── cubit
│   │   │       │   └── statitics_cubit.dart
│   │   │       └── pages
│   │   │           └── dashboard.dart
│   │   ├── main_navigation_bar
│   │   │   ├── cubit
│   │   │   │   ├── bottom_bar_cubit_cubit.dart
│   │   │   │   └── bottom_bar_cubit_state.dart
│   │   │   └── presentation
│   │   │       ├── page
│   │   │       │   └── main_nav_screen.dart
│   │   │       └── widget
│   │   │           └── bottom_nav_bar.dart
│   │   └── settings
│   │       └── presentation
│   │           ├── cubit
│   │           │   └── settings_cubit.dart
│   │           └── page
│   │               └── settings_page.dart
│   └── main.dart

