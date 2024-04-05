// import 'dart:async';
// import 'package:flutter/material.dart';

// class NfcGeneratorAnimation extends StatefulWidget {
//   const NfcGeneratorAnimation({super.key});

//   @override
//   _NfcGeneratorAnimationState createState() => _NfcGeneratorAnimationState();
// }

// class _NfcGeneratorAnimationState extends State<NfcGeneratorAnimation> {
//   bool _isCountingDown = false;
//   int _secondsLeft = 60;
//   Timer? _timer;

//   void _startCountdown() {
//     setState(() {
//       _isCountingDown = true;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondsLeft > 0) {
//           _secondsLeft--;
//         } else {
//           timer.cancel();
//           setState(() {
//             _isCountingDown = false;
//             _secondsLeft = 60; // Reset the countdown to 60 seconds
//           });
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: GestureDetector(
//         onTap: _isCountingDown ? _resetCountdown : _startCountdown,
//         child: Container(
//           width: MediaQuery.of(context).size.width / 2.5,
//           height: MediaQuery.of(context).size.width / 2.5,
//           decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.blue,
//           ),
//           child: Center(
//             child: _isCountingDown
//                 ? Text(
//                     "$_secondsLeft",
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                   )
//                 : const Text(
//                     "Generate NFC",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _resetCountdown() {
//     setState(() {
//       _isCountingDown = false;
//       _secondsLeft = 60; // Reset the countdown to 60 seconds
//     });
//     _timer?.cancel(); // Cancel the current timer
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';

class NfcGeneratorAnimation extends StatefulWidget {
  const NfcGeneratorAnimation({super.key});

  @override
  _NfcGeneratorAnimationState createState() => _NfcGeneratorAnimationState();
}

class _NfcGeneratorAnimationState extends State<NfcGeneratorAnimation>
    with SingleTickerProviderStateMixin {
  bool _isCountingDown = false;
  int _secondsLeft = 60;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    setState(() {
      _isCountingDown = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsLeft > 0) {
          _secondsLeft--;
        } else {
          timer.cancel();
          setState(() {
            _isCountingDown = false;
            _secondsLeft = 60; // Reset the countdown to 60 seconds
            _animationController.forward();
          });
        }
      });
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _isCountingDown ? _resetCountdown : _startCountdown,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.width / 2.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(
                  child: _isCountingDown
                      ? Text(
                          "$_secondsLeft",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : const Text(
                          "Generate NFC",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _resetCountdown() {
    setState(() {
      _isCountingDown = false;
      _secondsLeft = 60; // Reset the countdown to 60 seconds
    });
    _animationController.reset();

    _timer?.cancel(); // Cancel the current timer
    _animationController.reset();
  }
}
