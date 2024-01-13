import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:skybase/core/database/storage/storage_key.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';
import 'package:skybase/ui/views/intro/intro_data.dart';
import 'package:skybase/ui/views/login/login_view.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  String tag = 'IntroBloc::->';

  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  bool get isFirstPage => currentIndex == 0;

  bool get isLastPage => currentIndex == introItem.length - 1;

  IntroCubit() : super(IntroFirstPage());

  void onSkipPage() {
    pageController.jumpToPage(2);
    emit(IntroLastPage());
  }

  void onChangePage(int page) {
    currentIndex = page;
    if (isFirstPage) {
      emit(IntroFirstPage());
    } else if (isLastPage) {
      emit(IntroLastPage());
    } else {
      emit(IntroLoaded());
    }
  }

  void onPreviousPage() {
    pageController.previousPage(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 260),
    );
    if (isFirstPage) {
      emit(IntroFirstPage());
    } else if (isLastPage) {
      emit(IntroLastPage());
    } else {
      emit(IntroLoaded());
    }
  }

  void onDonePage(BuildContext context) {
    StorageManager.instance.save<bool>(StorageKey.FIRST_INSTALL, false);
    context.pushReplacementNamed(LoginView.route);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
