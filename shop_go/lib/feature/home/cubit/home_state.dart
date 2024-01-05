// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shop_go/core/base/cubit/base_cubit.dart';

class HomeState extends BaseState {
  const HomeState({required this.selectedIndex});
  final int? selectedIndex;
  @override
  List<Object?> get props => [selectedIndex];

  factory HomeState.initial() {
    return const HomeState(selectedIndex: -1);
  }

  HomeState copyWith({
    int? selectedIndex,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
