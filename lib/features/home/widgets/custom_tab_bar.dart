import 'package:flutter/material.dart';
import 'package:yara/core/constants/styles.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;

  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  // int currentTabIndex = 0;

  final List<String> tabsName = [
    'پوشه ها',
    'ایران ما',
    'پرونده ویژه',
    'همه ما',
  ];

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(
            tabsName.length,
            (index) => Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(2),
                  onTap: () {
                    setState(() {
                      // currentTabIndex = index;
                      widget.tabController.animateTo(index);
                    });
                  },
                  child: Container(
                    // color: Colors.blue,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tabsName[index],
                      style: TextStyle(
                        fontFamily: Styles.fonts.vazirMatn,
                        fontWeight: FontWeight.bold,
                        color: index == widget.tabController.index
                            ? Colors.white
                            : Colors.white70,
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 7),
                AnimatedContainer(
                  height: 3,
                  width: 60,
                  duration: const Duration(milliseconds: 100),
                  decoration: BoxDecoration(
                    color: index == widget.tabController.index
                        ? Colors.white
                        : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
