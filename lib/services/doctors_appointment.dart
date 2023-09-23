import 'package:dio/dio.dart';
import 'package:doc_appointment/models/appointment_history.dart';
import 'package:doc_appointment/models/appointment_options.dart';
import 'package:doc_appointment/models/available_doctor.dart';
import 'package:doc_appointment/models/booking_confirm.dart';

class DoctorAppointmentService {
  final Dio dio = Dio();

  final String hostUrl =
      'https://my-json-server.typicode.com/githubforekam/doctor-appointment/';

  Future<List<AvailableDoctors>> getDoctorList() async {
    List<AvailableDoctors> doctorList = [];

    try {
      final response = await dio.get('${hostUrl}doctors');

      if (response.statusCode == 200) {
        var data = response.data;

        for (var docList in data) {
          doctorList.add(AvailableDoctors.fromJson(docList));
        }
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            '${e.response!.statusCode} - ${e.response!.statusMessage}');
      }
    } catch (e) {
      throw Exception('Something went Wrong $e');
    }
    return doctorList;
  }

  Future<AppointmentOptions> getOption() async {
   
    late AppointmentOptions options;
    try {
      final response = await dio.get('${hostUrl}appointment_options');

      if (response.statusCode == 200) {
       
        options = AppointmentOptions.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            '${e.response!.statusCode} - ${e.response!.statusMessage}');
      }
    } catch (e) {
      throw Exception('Something went Wrong $e');
    }
    return options;
  }

  Future<BookingConfirm> getBookingConfirm() async {
    late BookingConfirm bookingConfirm;
    try {
      final response = await dio.get('${hostUrl}booking_confirmation');

      if (response.statusCode == 200) {
     
        bookingConfirm = BookingConfirm.fromJson(response.data);
      } else {
        throw Exception('Failed To load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            '${e.response!.statusCode} - ${e.response!.statusMessage}');
      }
    } catch (e) {
     
      throw Exception('Something went Wrong $e');
    }
    return bookingConfirm;
  }

  Future<List<AppointmentHistory>> getAppointmentHistory() async {
    List<AppointmentHistory> history = [];

    try {
      final response = await dio.get('${hostUrl}appointments');

      if (response.statusCode == 200) {
        
        var data = response.data;

        for (var dataList in data) {
          history.add(AppointmentHistory.fromJson(dataList));
        }
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
            '${e.response!.statusCode} - ${e.response!.statusMessage}');
      }
    } catch (e) {
      throw Exception('Something went Wrong $e');
    }

    return history;
  }
}
