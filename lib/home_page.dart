import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _firstTeController = TextEditingController();
  final TextEditingController _secondTeController = TextEditingController();
  double _result=0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic app'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,

          child: Column(
            children: [
              TextFormField(
                controller: _firstTeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('1st Number'),
                  hintText: "Enter 1st Number",
                ),
                validator: (String? value) {
                  if(value==null||value.isEmpty){
                    return 'Enter a valid number';
                  }else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _secondTeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('2nd Number'),
                  hintText: "Enter 2nd Number",
                ),
                validator: (String? value) {
                  if(value==null||value.isEmpty){
                    return 'Enter a valid number';
                  }else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20,),
              _buildButton(),

              const SizedBox(height: 20),
              Text('Result : ${_result.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold),),


            ],
          ),
        ),
     ),

    );



  }
  Widget _buildButton(){
  return Row(
  mainAxisAlignment: MainAxisAlignment.center,

  children: [
  IconButton(onPressed: _onTapAddButton, icon: const Icon(Icons.add)),
  IconButton(onPressed: _onTapMinusButton, icon: const Icon(Icons.remove)),
  TextButton(onPressed: _onTapMultiplyButton, child: const Text('x', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),)),
  TextButton(onPressed: _onTapDivideButton, child: const Text('/', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black),)),
  ],
  );
  }


  void _onTapAddButton() {
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstNum = double.tryParse(_firstTeController.text) ?? 0;
    double secondNum = double.tryParse(_secondTeController.text) ?? 0;
    _result = firstNum+secondNum;
    setState(() {});
  }
  void _onTapMinusButton() {
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstNum = double.tryParse(_firstTeController.text) ?? 0;
    double secondNum = double.tryParse(_secondTeController.text) ?? 0;
    _result = firstNum-secondNum;
    setState(() {});
  }
  void _onTapMultiplyButton() {
    if(_formKey.currentState!.validate()==false){
      return;
    }
    double firstNum = double.tryParse(_firstTeController.text) ?? 0;
    double secondNum = double.tryParse(_secondTeController.text) ?? 0;
    _result = firstNum*secondNum;
    setState(() {});

  }
  void _onTapDivideButton() {
    if(_formKey.currentState!.validate()==false){
        return;
    }
    double firstNum = double.tryParse(_firstTeController.text) ?? 0;
    double secondNum = double.tryParse(_secondTeController.text) ?? 0;
    _result = firstNum/secondNum;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _firstTeController.dispose();
    _secondTeController.dispose();
    super.dispose();
  }

}

