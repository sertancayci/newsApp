import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/platform_enum.dart';
import 'package:news_app/models/number_model.dart';
import 'package:news_app/utility/firebase/firebase_collections.dart';
import 'package:news_app/utility/version_manager.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(SplashState());

  Future<void> checkAppVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRedirectHome: false);
      return;
    }

    final checkForceUpdate = VersionManager(
      deviceValue: clientVersion,
      databaseValue: databaseValue,
    );

    if (checkForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  //webden gelen kullanıcıda ihtiyaç yok
  Future<String?> getVersionNumberFromDatabase() async {
    if (kIsWeb) {
      return null;
    }

    final response = await FirebaseCollections.version.referance
        .withConverter<NumberModel>(
        fromFirestore:(snapshot, options) =>
            NumberModel().fromFirebase(snapshot),
        toFirestore: (value, options){
          return value.toJson();
        },
    )
        .doc(PlatformEnum.versionName).get();


    return  response.data()?.number;
  }
}

class SplashState extends Equatable {
  SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  // TODO: implement props
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({bool? isRequiredForceUpdate, bool? isRedirectHome}) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
