import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/constants/string_constants.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) {
              print('login babbaaa ${state.user}');
            }
          }),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 16, right: 16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.loginTitle,
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    StringConstants.loginSubtitle,
                    style: context.textTheme.titleMedium?.copyWith(),
                  ),
                  firebase.LoginView(
                    action: firebase.AuthAction.signIn,
                    actionButtonLabelOverride: "Giriş Yap",
                    showTitle: false,
                    providers: firebase.FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
