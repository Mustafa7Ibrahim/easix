import 'package:easix/easix.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easix Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  final now = DateTime.now();

  final image = "https://fakeimg.pl/350x200/?text=World&font=lobster";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('easix Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            Column(
              children: [
                12.ph,
                Container(color: Colors.red, height: 100),
                const Gap(16),
                Container(color: Colors.red, height: 100),
                12.ph,
              ],
            ),
            12.p,
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                spacing: 16.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Normal Image"),
                  AdaptiveImage(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    borderRadius: 8.0,
                    placeholder: const CircularProgressIndicator.adaptive(),
                    alignment: Alignment.center,
                    repeat: ImageRepeat.noRepeat,
                    borderWidth: 1.0,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                  ),
                  const Text("Circle Image"),
                  AdaptiveImage(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    borderRadius: 50.0,
                    placeholder: const CircularProgressIndicator.adaptive(),
                    alignment: Alignment.center,
                    // repeat: ImageRepeat.noRepeat,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    onTap: () => print('Image tapped'),
                  ),
                  const Text("Rounded Image"),
                  AdaptiveImage(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    borderRadius: 8.0,
                    placeholder: const CircularProgressIndicator.adaptive(),
                    alignment: Alignment.center,
                    repeat: ImageRepeat.noRepeat,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    onTap: () => print('Image tapped'),
                  ),
                  const Text("Rounded Image with border"),
                  AdaptiveImage(
                    image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    borderRadius: 12.0,
                    placeholder: const CircularProgressIndicator.adaptive(),
                    alignment: Alignment.center,
                    repeat: ImageRepeat.noRepeat,
                    borderColor: Colors.black,
                    borderWidth: 12.0,
                    animationDuration: const Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    onTap: () => print('Image tapped'),
                  ),
                ],
              ),
            ),
            Text(
              "Now (English): ${now.toHumanDate()}\n"
              "Before 1 Hour (English): ${now.subtract(const Duration(hours: 1)).toHumanDate()}\n"
              "Before 1 Day (English): ${now.subtract(const Duration(days: 1)).toHumanDate()}\n"
              "Before 2 Days (English): ${now.subtract(const Duration(days: 2)).toHumanDate()}\n"
              "Before 10 Days (English, Short): ${now.subtract(const Duration(days: 10)).toHumanDate()}\n"
              "Before 10 Days (English, Full): ${now.subtract(const Duration(days: 10)).toHumanDate(displayType: DateMode.full)}\n"
              "Before 1 Month (English): ${now.subtract(const Duration(days: 30)).toHumanDate()}\n"
              "Before 1 Year (English, full): ${now.subtract(const Duration(days: 365)).toHumanDate(displayType: DateMode.full)}\n"
              "-----------------------------------\n"
              "Before 1 Hour (Arabic): ${now.subtract(const Duration(hours: 1)).toHumanDate(language: DateLang.ar)}\n"
              "Before 1 Day (Arabic): ${now.subtract(const Duration(days: 1)).toHumanDate(language: DateLang.ar)}\n"
              "Before 2 Days (Arabic): ${now.subtract(const Duration(days: 2)).toHumanDate(language: DateLang.ar)}\n"
              "Before 10 Days (Arabic, Short): ${now.subtract(const Duration(days: 10)).toHumanDate(language: DateLang.ar)}\n"
              "Before 10 Days (Arabic, Full): ${now.subtract(const Duration(days: 10)).toHumanDate(displayType: DateMode.full, language: DateLang.ar)}\n"
              "Before 1 Month (Arabic): ${now.subtract(const Duration(days: 30)).toHumanDate(language: DateLang.ar)}\n"
              "Before 1 Year (Arabic, full): ${now.subtract(const Duration(days: 365)).toHumanDate(language: DateLang.ar, displayType: DateMode.full)}\n"
              "-----------------------------------\n"
              "After 1 Hour (English): ${now.add(const Duration(hours: 1)).toHumanDate()}\n"
              "After 1 Day (English): ${now.add(const Duration(days: 1)).toHumanDate()}\n"
              "After 2 Days (English): ${now.add(const Duration(days: 2)).toHumanDate()}\n"
              "After 10 Days (English, Short): ${now.add(const Duration(days: 10)).toHumanDate()}\n"
              "After 10 Days (English, Full): ${now.add(const Duration(days: 10)).toHumanDate(displayType: DateMode.full)}\n"
              "After 1 Month (English): ${now.add(const Duration(days: 30)).toHumanDate()}\n"
              "After 1 Year (English, full): ${now.add(const Duration(days: 365)).toHumanDate()}\n"
              "-----------------------------------\n"
              "After 1 Hour (Arabic): ${now.add(const Duration(hours: 1)).toHumanDate(language: DateLang.ar)}\n"
              "After 1 Day (Arabic): ${now.add(const Duration(days: 1)).toHumanDate(language: DateLang.ar)}\n"
              "After 2 Days (Arabic): ${now.add(const Duration(days: 2)).toHumanDate(language: DateLang.ar)}\n"
              "After 10 Days (Arabic, Short): ${now.add(const Duration(days: 10)).toHumanDate(language: DateLang.ar)}\n"
              "After 10 Days (Arabic, Full): ${now.add(const Duration(days: 10)).toHumanDate(displayType: DateMode.full, language: DateLang.ar)}\n"
              "After 1 Month (Arabic): ${now.add(const Duration(days: 30)).toHumanDate(language: DateLang.ar)}\n"
              "After 1 Year (Arabic, full): ${now.add(const Duration(days: 365)).toHumanDate(language: DateLang.ar, displayType: DateMode.full)}\n",
            ),
            24.ph,
          ],
        ),
      ),
    );
  }
}
