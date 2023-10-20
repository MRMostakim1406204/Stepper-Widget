import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

int _currentActiveStep =0;
 
 List<Step> StepList() =>[
  Step(
    isActive: _currentActiveStep >=0,
    title: Text("Beginner",
    style: TextStyle(fontSize: 20,color: Colors.black),),
     content: Center(
      child: Text("I am a beginner programer",
      style: TextStyle(fontSize: 17,color: Colors.black),),
      )),

   Step(
    isActive: _currentActiveStep >=1,
    title: Text("Mid Level",
    style: TextStyle(fontSize: 20,color: Colors.black),),
     content: Center(
      child: Text("I am a Mid Level programer",
      style: TextStyle(fontSize: 17,color: Colors.black),),
      )),
    Step(
      isActive: _currentActiveStep >=2,
      title: Text("Advanced",
      style: TextStyle(fontSize: 20,color: Colors.black),), 
      content: Center(
        child: Text("I am a Advanced programer",
        style: TextStyle(fontSize: 17,color: Colors.black),),
        )),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Widget"),
        centerTitle: true,
      ),
      body: Stepper(
        onStepContinue: (){
          if(_currentActiveStep< (StepList().length -1)){
            setState(() {
              _currentActiveStep +=1;
            });
          }
        },
        onStepCancel: (){
          if (_currentActiveStep ==0){
            return;
          }
          setState(() {
            _currentActiveStep -=1;
          });
        },onStepTapped: (int index){
          setState(() {
            _currentActiveStep = index;
          });
        },
        currentStep: _currentActiveStep,
        steps: StepList()),
    );
  }
}