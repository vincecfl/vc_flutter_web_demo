import 'package:flutter/material.dart';
import 'package:vc_flutter_web_demo/json/friend_link_bean.dart';
import '../widgets/friend_link_item.dart';
import '../widgets/common_layout.dart';

class FriendLinkPage extends StatelessWidget {
  final beans = FriendLinkBean().beans;

  @override
  Widget build(BuildContext context) {
    final isNotMobile = !PlatformDetector().isMobile();

    return CommonLayout(
        pageType: PageType.link,
        child: Container(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return true;
            },
            child: isNotMobile
                ? SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(beans.length, (index) {
                        return FriendLinkItem(
                          bean: beans[index],
                        );
                      }),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) {
                      return FriendLinkItem(
                        bean: beans[index],
                      );
                    },
                    itemCount: beans.length,
                  ),
          ),
        ),
      );
  }
}
