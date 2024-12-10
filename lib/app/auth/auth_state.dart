import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthState extends Equatable {
  const AuthState._({
    this.isLoading = false,
    this.errorMessage,
    this.isAuthenticated = false,
    this.user,
  });

  final bool isLoading;
  final String? errorMessage;
  final bool isAuthenticated;
  final firebase_auth.User? user;

  const AuthState.initial() : this._();

  AuthState setLoading(bool isLoading) {
    return _copyWith(
      isLoading: isLoading,
    );
  }

  AuthState setError(String? errorMessage) {
    return _copyWith(
      errorMessage: errorMessage,
      isLoading: false,
    );
  }

  AuthState setAuthenticated({required bool isAuthenticated, firebase_auth.User? user}) {
    return _copyWith(
      isAuthenticated: isAuthenticated,
      user: user,
      isLoading: false,
    );
  }

  AuthState signOut() {
    return AuthState.initial();
  }

  AuthState _copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isAuthenticated,
    firebase_auth.User? user,
  }) {
    return AuthState._(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    isAuthenticated,
    user,
  ];
}
