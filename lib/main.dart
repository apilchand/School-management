import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pathsala/screens/webLanding.dart';
import 'firebase_options.dart';
import 'screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pathshala',
      theme:  FlexThemeData.light(
  scheme: FlexScheme.purpleBrown,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 1,
  appBarStyle: FlexAppBarStyle.background,
  bottomAppBarElevation: 2.0,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    thinBorderWidth: 3.0,
    thickBorderWidth: 0.5,
    adaptiveRemoveElevationTint: FlexAdaptive.excludeWebAndroidFuchsia(),
    adaptiveElevationShadowsBack: FlexAdaptive.excludeWebAndroidFuchsia(),
    adaptiveAppBarScrollUnderOff: FlexAdaptive.excludeWebAndroidFuchsia(),
    defaultRadius: 10.0,
    defaultRadiusAdaptive: 16.0,
    adaptiveRadius: FlexAdaptive.excludeWebAndroidFuchsia(),
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    toggleButtonsBorderSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 19,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedBorderWidth: 1.0,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    fabUseShape: true,
    fabAlwaysCircular: true,
    fabSchemeColor: SchemeColor.tertiary,
    cardRadius: 14.0,
    popupMenuRadius: 6.0,
    popupMenuElevation: 3.0,
    dialogRadius: 18.0,
    datePickerDialogRadius: 18.0,
    timePickerDialogRadius: 18.0,
    appBarScrolledUnderElevation: 1.0,
    drawerElevation: 1.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomSheetRadius: 18.0,
    bottomSheetElevation: 2.0,
    bottomSheetModalElevation: 4.0,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6.0,
    menuElevation: 3.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    menuBarShadowColor: Color(0x00000000),
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarElevation: 1.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
    keepPrimary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  
),
darkTheme: FlexThemeData.dark(
  scheme: FlexScheme.purpleBrown,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 2,
  appBarStyle: FlexAppBarStyle.background,
  bottomAppBarElevation: 2.0,
  subThemesData: const FlexSubThemesData(
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    adaptiveElevationShadowsBack: FlexAdaptive.all(),
    adaptiveAppBarScrollUnderOff: FlexAdaptive.excludeWebAndroidFuchsia(),
    defaultRadius: 10.0,
    defaultRadiusAdaptive: 16.0,
    adaptiveRadius: FlexAdaptive.excludeWebAndroidFuchsia(),
    thinBorderWidth: 3.0,
    thickBorderWidth: 0.5,
    elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
    elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    toggleButtonsBorderSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    inputDecoratorSchemeColor: SchemeColor.primary,
    inputDecoratorBackgroundAlpha: 22,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedBorderWidth: 1.0,
    inputDecoratorPrefixIconSchemeColor: SchemeColor.primary,
    fabUseShape: true,
    fabAlwaysCircular: true,
    fabSchemeColor: SchemeColor.tertiary,
    cardRadius: 14.0,
    popupMenuRadius: 6.0,
    popupMenuElevation: 3.0,
    dialogRadius: 18.0,
    datePickerDialogRadius: 18.0,
    timePickerDialogRadius: 18.0,
    appBarScrolledUnderElevation: 3.0,
    drawerElevation: 1.0,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    bottomSheetRadius: 18.0,
    bottomSheetElevation: 2.0,
    bottomSheetModalElevation: 4.0,
    bottomNavigationBarMutedUnselectedLabel: false,
    bottomNavigationBarMutedUnselectedIcon: false,
    menuRadius: 6.0,
    menuElevation: 3.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    menuBarShadowColor: Color(0x00000000),
    navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarElevation: 1.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.primary,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
  ),
  keyColors: const FlexKeyColors(
    useSecondary: true,
    useTertiary: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
 
),
 themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,
      home: getHomePage()
    );
  }
  Widget getHomePage() {
    if (kIsWeb) {
      // Return the LandingPage for web
      return LandingPage();
    } else {
      // Return the WelcomeScreen for mobile
      return const WelcomeScreen();
    }
  }

}
