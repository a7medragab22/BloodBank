import 'package:blodbank/features/Home/presentation/Views/requestBlood/presentation/models/blood_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'blood_request_state.dart';

class BloodRequestCubit extends Cubit<BloodRequestState> {
  BloodRequestCubit() : super(BloodRequestInitial());
  static BloodRequestCubit get(context) => BlocProvider.of(context);
  final List<BloodRequestModel> requests = [];
  Future<void> submitRequest(BloodRequestModel model) async {
    emit(BloodRequestLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (isClosed) return;
      requests.add(model);
      emit(BloodRequestSuccess(requests));
    } catch (e) {
      if (isClosed) return;
      emit(BloodRequestFailure('there was an error ${e.toString()}'));
    }
  }
}
