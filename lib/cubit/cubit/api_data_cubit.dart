import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsapi/Api/apicall.dart';

import '../../model/response model.dart';

part 'api_data_state.dart';

class ApiDataCubit extends Cubit<ApiDataState> {
  ApiDataCubit() : super(ApiDataInitial());

  void getdata(int pages, String newsName) async {
    emit(ApiDataLoading());
    try {
      final ResponseModel responseModel =
          await ApiProvider.getAllData(pages, newsName);
      emit(ApiDataLoaded(responseModel));
    } catch (e) {
      emit(ApiDataFailed());
      throw Exception(e);
    }
  }
}


// apple