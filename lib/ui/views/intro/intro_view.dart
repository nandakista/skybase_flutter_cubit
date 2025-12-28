import 'package:flutter/material.dart';
import 'package:skybase/config/base/main_navigation.dart';
import 'package:skybase/config/themes/app_colors.dart';
import 'package:skybase/core/database/storage/storage_key.dart';
import 'package:skybase/core/database/storage/storage_manager.dart';
import 'package:skybase/ui/views/intro/intro_data.dart';
import 'package:skybase/ui/views/intro/widgets/intro_indicator.dart';
import 'package:skybase/ui/views/login/login_view.dart';

import 'widgets/intro_content.dart';

class IntroView extends StatefulWidget {
  static const String route = '/intro';

  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool get isLastPage => currentIndex == introItem.length - 1;

  bool get isFirstPage => currentIndex == 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: kToolbarHeight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (isFirstPage)
                      ? const SizedBox()
                      : InkWell(
                        onTap: () {
                          pageController.previousPage(
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 260),
                          );
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                  if (!isLastPage)
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(2);
                      },
                      child: const Text(
                        "Lewati",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: introItem.length,
                controller: pageController,
                itemBuilder: (context, index) {
                  final item = introItem[index];
                  return IntroContent(
                    image: item.image,
                    title: item.tittle,
                    description: item.description,
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 46),
            SizedBox(
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    child: Visibility(
                      visible: !isFirstPage,
                      child: InkWell(
                        onTap: () {
                          pageController.previousPage(
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 260),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                  IntroIndicator(
                    itemCount: introItem.length,
                    currentIndex: currentIndex,
                  ),
                  const SizedBox(width: 48),
                  SizedBox(
                    width: 40,
                    child: Visibility(
                      visible: isLastPage,
                      child: GestureDetector(
                        onTap: () {
                          StorageManager.instance.save<bool>(
                            StorageKey.FIRST_INSTALL,
                            false,
                          );
                          Navigation.instance.pushReplacement(
                            context,
                            LoginView.route,
                          );
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 46),
          ],
        ),
      ),
    );
  }
}
