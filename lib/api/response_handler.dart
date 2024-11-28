import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';


class ResponseHandler {

  // AppError handleError({required error, bool withFormError = false}) {
  //   if (error is AppError) {
  //     return error;
  //   }
  //   AppErrorResponse newError = manageError(error);
  //   return newError.appError(withFormError);
  // }
  //
  // AppErrorResponse manageError(DioException error) {
  //   var newError = AppErrorResponse(message: t.error.errorUnknown);
  //
  //   if (error.response != null) {
  //     // Gérer les erreurs d'authentification ici
  //     if (error.response?.statusCode == 403) {
  //       newError = AppErrorResponse(message: t.error.errorInvalidCredentials);
  //     } else {
  //       // Autres codes d'erreur
  //       newError = AppErrorResponse(
  //         message: 'Erreur: ${error.response?.statusCode}',
  //       );
  //     }
  //   } else {
  //     newError = AppErrorResponse(message: t.error.errorUnknown);
  //   }
  //
  //   log("Error WS ${error.response?.statusCode}: ${newError.message} -> ${error.requestOptions.uri}");
  //   return newError;
  // }
}
