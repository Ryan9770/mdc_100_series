// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'backdrop.dart';
import 'category_menu_page.dart';
import 'color.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';

// TODO: Convert ZoneApp to stateful widget (104)
class ZoneApp extends StatefulWidget {
  const ZoneApp({Key? key}) : super(key: key);

  @override
  State<ZoneApp> createState() => _ZoneAppState();
}

class _ZoneAppState extends State<ZoneApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zone',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => Backdrop(
              // TODO: Make currentCategory field take _currentCategory (104)
              currentCategory: _currentCategory,
              // TODO: Pass _currentCategory for frontLayer (104)
              frontLayer: HomePage(),
              // TODO: Change backLayer field value to CategoryMenuPage (104)
              backLayer: CategoryMenuPage(
                currentCategory: _currentCategory,
                onCategoryTap: _onCategoryTap,
              ),
              frontTitle: Text('ZONE'),
              backTitle: Text('MENU'),
            ),
        // TODO: Make currentCategory field take _currentCategory (104)
        // TODO: Pass _currentCategory for frontLayer (104)
        // TODO: Change backLayer field value to CategoryMenuPage (104)
      },
      // TODO: Customize the theme (103)
      theme: _kZoneTheme,
    );
  }
}

// TODO: Build a Theme (103)
final ThemeData _kZoneTheme = _buildZoneTheme();

ThemeData _buildZoneTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kZonePink100,
      onPrimary: kZoneBrown900,
      secondary: kZoneBrown900,
      error: kZoneErrorRed,
    ),
    // TODO: Add the text themes (103)
    textTheme: _buildZoneTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kZonePink100,
    ),
    // TODO: Add the icon themes (103)
    // TODO: Decorate the inputs (103)
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kZoneBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kZoneBrown900,
      ),
    ),
  );
}

TextTheme _buildZoneTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kZoneBrown900,
        bodyColor: kZoneBrown900,
      );
}


// TODO: Build a Text Theme (103)
