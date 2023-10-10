
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(AuthenticationState());

  Future<void> fetchUserDetail(User user) async {
    final token = await user.getIdToken();
  }
}

class AuthenticationState {

}