import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/feature/auth/authentication_provider.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {
  final authProvider =
      StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) {
              print('login');
            } else {
              Navigator.pushReplacementNamed(context, '/profile');
            }
          }),
        ],
        child: SafeArea(
          child: Center(
            child: Theme(
              data: context.appTheme.copyWith(
                outlinedButtonTheme: OutlinedButtonThemeData(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white
                    ),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: firebase.LoginView(
                  action: firebase.AuthAction.signIn,
                  actionButtonLabelOverride: "Giriş Yap",
                  showTitle: false,
                  providers: firebase.FirebaseUIAuth.providersFor(
                      FirebaseAuth.instance.app),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
