import 'dart:async';

// import 'package:flutter/material.dart';

// class NfcGeneratorAnimation extends StatefulWidget {
//   const NfcGeneratorAnimation({super.key});

//   @override
//   _NfcGeneratorAnimationState createState() => _NfcGeneratorAnimationState();
// }

// class _NfcGeneratorAnimationState extends State<NfcGeneratorAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool _isAnimating = false;
//   int _timeRemaining = 60;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 60),
//     );
//     _animation = Tween<double>(begin: 0.1, end: 1.5).animate(_controller)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _isAnimating = false;
//         }
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _startAnimation() {
//     _isAnimating = true;
//     _timeRemaining = 60;
//     _controller.forward(from: 0.0);
//     Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_timeRemaining > 0) {
//         setState(() {
//           _timeRemaining--;
//         });
//       } else {
//         timer.cancel();
//         _stopAnimation();
//       }
//     });
//   }

//   void _stopAnimation() {
//     _isAnimating = false;
//     _controller.reset();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _isAnimating ? null : _startAnimation,
//       child: Stack(
//         children: [
//           Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width / 2.5,
//               height: MediaQuery.of(context).size.width / 2.5,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.blue,
//               ),
//               child: const Center(
//                 child: Text(
//                   'Generate NFC',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Container(
//                 width: MediaQuery.of(context).size.width * _animation.value,
//                 height: MediaQuery.of(context).size.width * _animation.value,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue.withOpacity(0.2),
//                 ),
//               );
//             },
//           ),
//           if (_isAnimating)
//             Positioned(
//               top: 16.0,
//               right: 16.0,
//               child: GestureDetector(
//                 onTap: _stopAnimation,
//                 child: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(16.0),
//                   ),
//                   child: Text(
//                     '$_timeRemaining',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18.0,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';

class NfcGeneratorAnimation extends StatefulWidget {
  const NfcGeneratorAnimation({super.key});

  @override
  _NfcGeneratorAnimationState createState() => _NfcGeneratorAnimationState();
}

class _NfcGeneratorAnimationState extends State<NfcGeneratorAnimation> {
  bool _isCountingDown = false;
  int _secondsLeft = 60;
  Timer? _timer;

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
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _isCountingDown ? _resetCountdown : _startCountdown,
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
      ),
    );
  }

  void _resetCountdown() {
    setState(() {
      _isCountingDown = false;
      _secondsLeft = 60; // Reset the countdown to 60 seconds
    });
    _timer?.cancel(); // Cancel the current timer
  }
}
