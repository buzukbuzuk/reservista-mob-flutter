import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ReservistaAuthUser {
  ReservistaAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ReservistaAuthUser> reservistaAuthUserSubject =
    BehaviorSubject.seeded(ReservistaAuthUser(loggedIn: false));
Stream<ReservistaAuthUser> reservistaAuthUserStream() =>
    reservistaAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
