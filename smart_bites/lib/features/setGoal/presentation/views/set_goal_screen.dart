import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_bites/core/helper_functions/get_it_helper.dart';
import 'package:smart_bites/features/setGoal/presentation/views/widgets/food_card.dart';
import 'package:smart_bites/features/setGoal/presentation/views/widgets/set_goal_button.dart';
import 'package:smart_bites/features/setGoal/presentation/views/widgets/slider.dart';

class SetGoalPage extends StatefulWidget {
  static const String routeName = 'setGoalPage';

  const SetGoalPage({super.key});
  @override
  _SetGoalPageState createState() => _SetGoalPageState();
}

class _SetGoalPageState extends State<SetGoalPage> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Text(
                "Set Goal",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "calories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              // Slider Section
              CaloriesSlider(currentValue: _currentValue, maxtValue: _maxValue),
              const SizedBox(height: 50),

              // Your Food
              const Text(
                "Your Food",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
              Padding(
                padding: const EdgeInsets.only(left: 90),
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
