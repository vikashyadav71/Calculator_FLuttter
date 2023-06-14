import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
void  main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
      theme:ThemeData.dark(),home: MyApp()));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final controller=TextEditingController();
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  var result=0;
  Widget fun(var a){
    return RawMaterialButton(onPressed: (){controller.text=controller.text+a;},
    child: Text('$a'),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Calculator')),
      body: SizedBox(
        child: Column(
          children: [TextFormField(controller: controller,
         //textDirection:TextDirection.ltr ,
         textInputAction: TextInputAction.next,
         // onChanged: (value){ setState(() { result=value; });}
              ),
            Expanded(
              child: GridView.count(crossAxisCount: 4,
                children: [fun('1'),
                fun('2'),
                fun('3'),
                fun('+'),
                fun('4'),
                  fun('5'),
                  fun('6'),
                  fun('-'),
                  fun('7'),
                  fun('8'),
                  fun('9'),
                  fun('*'),
                  RawMaterialButton( child:Text('='),onPressed: () {var a=controller.text.interpret(); Navigator.push(context, MaterialPageRoute(builder: (context)=>moto(data:a.toString(),)));}


// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                ,),
                  fun('0'),
                  fun('/'),
               RawMaterialButton(onPressed: (){controller.text="";},child: Text('Clear'),)

                ],
              )
            ),
          ],
        ),
      ),
    );

  }
}
class moto extends StatelessWidget {
  const moto({Key? key,required this.data}) : super(key: key);
final data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(data)),
          TextButton(onPressed: (){Navigator.pop(context);}, child:Text('Go  Back'))
        ],
      ),),
    );
  }
}
