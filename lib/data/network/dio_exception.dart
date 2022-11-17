// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message =
            "Request to API server was cancelled"; //API sunucusu isteği iptal edildi
        break;

      case DioErrorType.connectTimeout:
        message =
            "Connection timeout with API server"; //API sunucusuyla bağlantı zaman aşımı
        break;

      case DioErrorType.receiveTimeout:
        message =
            "Receive timeout in connection with API server"; //API sunucusuyla bağlantılı olarak zaman aşımı alın
        break;

      case DioErrorType.sendTimeout:
        message =
            "Send timeout in connection with API server"; //API sunucusuyla bağlantılı olarak zaman aşımı gönder
        break;

      case DioErrorType.other:
        //Soket İstisnası
        if (dioError.message.contains("SocketException")) {
          message = "No Internet"; //İnternet Yok
          break;
        }
        message = "Unexpected error occurred"; //Beklenmedik hata oluştu
        break;

      case DioErrorType.response:
        message = _handleError(
            dioError.response?.statusCode, dioError.response?.data);
        break;

      default:
        message = "Something went wrong"; //Bir şeyler yanlış gitti
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return "Bad request"; // Geçersiz istek
      case 401:
        return 'Unauthorized'; //Yetkisiz
      case 403:
        return 'Forbidden'; //Yasaklı
      case 404:
        return error['message']; //mesaj
      case 500:
        return 'Internal server error'; //Sunucu Hatası
      case 502:
        return 'Bad gateway'; //Bad ağ geçidi
      default:
        return 'Oops something went wrong'; //Hoop! Birşeyler yanlış gitti
    }
  }

  @override
  String toString() => message;
}
