import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yara/features/home/screens/all_of_us.dart';
import 'package:yara/features/home/screens/directories.dart';
import 'package:yara/features/home/screens/our_iran.dart';
import 'package:yara/features/home/screens/special_case.dart';
import 'package:yara/features/home/widgets/custom_tab_bar.dart';

import '../../../core/constants/assets_path.dart';
import '../../../core/constants/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff337c67),
        leading: Padding(
          padding: const EdgeInsets.all(17),
          child: SvgPicture.asset(
            AssetPaths.icons.search,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'یارا',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: Styles.fonts.vazirMatn,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        bottom: CustomTabBar(tabController: tabController),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Directories(),
          OurIran(),
          SpecialCase(),
          AllOfUs(),
        ],
      ),
    );
  }
}
