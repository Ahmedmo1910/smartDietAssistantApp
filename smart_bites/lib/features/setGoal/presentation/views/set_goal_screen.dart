import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/core/utils/app_text_styles.dart';
import 'package:smart_bites/features/setGoal/presentation/views/widgets/food_card.dart';
import 'package:smart_bites/features/setGoal/presentation/views/widgets/set_goal_button.dart';
import 'package:smart_bites/features/setGoal/presentation/views/widgets/slider.dart';

class SetGoalScreen extends StatefulWidget {
  static const String routeName = 'SetGoalScreen';

  const SetGoalScreen({super.key});
  @override
  _SetGoalScreenState createState() => _SetGoalScreenState();
}

class _SetGoalScreenState extends State<SetGoalScreen> {
  final prefs = getIt<SharedPreferences>();
  final GlobalKey<FormState> _keyDialog = GlobalKey();
  final TextEditingController _controllerDialog = TextEditingController();
  late String userInput;
  double _currentValue = 0;
  double _maxValue = 1000;
  final double _kCal = 250;
  bool _isAdded = false;

  @override
  void initState() {
    _currentValue = prefs.getDouble('currentValue') ?? 0;
    _maxValue = prefs.getDouble("maxValue") ?? 1000;
    _isAdded = prefs.getBool("isAdded") ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text("Set Goal", style: AppTextStyles.bold40),
              const SizedBox(height: 10),
              const Text("calories", style: AppTextStyles.regular24),
              const SizedBox(height: 32),

              // Slider Section
              CaloriesSlider(currentValue: _currentValue, maxtValue: _maxValue),
              const SizedBox(height: 50),

              // Your Food
              const Text(
                "Your Food",
                style: AppTextStyles.semiBold20,
              ),
              const SizedBox(height: 15),

              // Food Card
              FoodCard(
                kCal: _kCal,
                isAdded: _isAdded,
                onAdd: () {
                  setState(() {
                    _currentValue += _kCal;
                    _isAdded = true;
                  });
                  prefs.setDouble("currentValue", _currentValue);
                  prefs.setBool("isAdded", _isAdded);
                },
              ),
              SizedBox(height: 40),
              Align(
                alignment: AlignmentGeometry.center,
                child: SetGoalButton(
                  formState: _keyDialog,
                  controller: _controllerDialog,
                  onSave: (String value) {
                    setState(() {
                      _maxValue = double.tryParse(value) ?? _maxValue;
                    });
                    prefs.setDouble("maxValue", _maxValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
