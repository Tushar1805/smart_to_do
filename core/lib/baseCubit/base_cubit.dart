import 'package:core/states/data_state.dart';
import 'package:core/utils/core_utils.dart';
import 'package:core/utils/custom_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_to_do_app/resources/app_strings.dart';

class BaseCubit extends Cubit<DataState> {
  BaseCubit() : super(InitialState());

  void handleExceptions(final Object e) {
    final message = e is CustomException
        ? e
        : e is NoInternetException
            ? noInternetString
            : someErrorOccurredString;

    customPrint('ERROR: $message: $e');

    emit(ErrorState(message.toString()));
  }
}
