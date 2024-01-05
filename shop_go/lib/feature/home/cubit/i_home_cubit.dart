import 'package:shop_go/core/base/cubit/base_cubit.dart';
import 'package:shop_go/feature/home/cubit/home_state.dart';

abstract class IHomeCubit extends BaseCubit<HomeState> {
  IHomeCubit(super.initialState);
  setSelectedIndex(int index);
}
