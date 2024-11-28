
import '../../utils/one_time_event.dart';

enum AppErrorType {
  mfaIsRequired,
  invalidInvitation,
  maintenanceServer,
  cmtAuthError,
  notAuth,
  invalidCredentials
}

class AppError implements Exception {
  AppError({
    this.statusCode,
    this.globalMessage,
    this.formErrors,
    this.description,
    this.type,
  });

  final int? statusCode;
  final String? globalMessage;
  final OneTimeEvent<FormErrors?>? formErrors;
  final String? description;
  final OneTimeEvent<AppErrorType?>? type;

  static final unknown = AppError(
    globalMessage: "An unknown error occured",
  );

  static final invalidCredentials = AppError(
      globalMessage: "Invalid credentials provided",
      type: OneTimeEvent(AppErrorType.invalidCredentials)
  );

  static final disconnected = AppError(
    globalMessage: "You are disconnected",
    type: OneTimeEvent(AppErrorType.notAuth),
  );

  static final AppError notAuth = AppError(
    globalMessage: "You are not authenticated",
    type: OneTimeEvent(AppErrorType.notAuth),
  );


}

class FormErrors implements Exception {
  FormErrors({
    this.client,
    this.job,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  final String? client;
  final String? job;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
}
