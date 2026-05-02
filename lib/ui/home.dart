import 'package:flutter/material.dart';
import 'package:pace_up/ui/features/activity/activity.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              const Text("PaceUp!"),
              FilledButton(
                child: const Text("Start Activity"),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Activity(),
                    )
                  );
                },
              ),
              FilledButton(
                onPressed: (){},
                child: const Text("View Configs")
              ),
              FilledButton(
                onPressed: (){},
                child: const Text("Activity History")
              )
            ],
          ),
        ),
      ) 
    );
  }
}