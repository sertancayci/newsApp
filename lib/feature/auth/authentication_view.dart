import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/feature/auth/authentication_provider.dart';
import 'package:news_app/widget/text/subtitle_text.dart';
import 'package:news_app/widget/text/title_text.dart';

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
    checkUser(FirebaseAuth.instance.currentUser);
  }

  void checkUser(User? user) {
    if (user != null) {
      ref.read(authProvider.notifier).fetchUserDetail(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) {
            checkUser(state.user);
            }
          }),
        ],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 16, right: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _header(),
                  firebase.LoginView(
                    action: firebase.AuthAction.signIn,
                    showTitle: false,
                    providers: firebase.FirebaseUIAuth.providersFor(
                        FirebaseAuth.instance.app),
                  ),
                  if (ref.watch(authProvider).isRedirect)
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          StringConstants.continueTheApp,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodySmall
                              ?.copyWith(decoration: TextDecoration.underline),
                        ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _header extends StatelessWidget {
  const _header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleText(
          value: StringConstants.loginTitle,
        ),
        SubtitleText(
           value: StringConstants.loginSubtitle,
        ),
      ],
    );
  }
}
