import 'package:shop_go/feature/home/cubit/home_state.dart';
import 'package:shop_go/feature/home/cubit/i_home_cubit.dart';

class HomeCubit extends IHomeCubit {
  HomeCubit() : super(HomeState.initial());

  @override
  void init() {}

  @override
  setSelectedIndex(int index) => emit(state.copyWith(selectedIndex: index));
}
