import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:retrofit/dio.dart';

abstract class BaseRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();

      return DataSuccess(data: httpResponse.data);
    } on DioException catch (e) {
      return DataFailed(error: e);
    }
  }
}
