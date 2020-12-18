import 'package:flutter/material.dart';
import 'dart:async';

class TimeCounter extends StatefulWidget {
  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  Stopwatch _watch;
  Timer _timer;
  Duration _duration;

  void _onStart() {
    setState(() {
      _watch = Stopwatch();
      _timer = Timer.periodic(Duration(milliseconds: 250), _onTimeout);
    });
    _watch.start();
  }

  void _onStop() {
    _timer.cancel();
    _watch.stop();
  }

  void _onTimeout(Timer timer) {
    if (!_watch.isRunning) return;
    setState(() => _duration = _watch.elapsed);
  }

  void _onClear(Duration value) {
    setState(() => _duration = Duration());
  }

  @override
  void initState() {
    _duration = Duration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: [
            TimeDisplay(
              color: Colors.red,
              duration: _duration,
              onClear: _onClear,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: _onStart,
                    child: Text('Start'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: _onStop,
                    child: Text('Stop'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TimeDisplay extends StatelessWidget {
  TimeDisplay({Key key, this.color, Duration this.duration, this.onClear})
      : super(key: key);

  Duration duration = Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  void _onClicked() {
    onClear(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(duration.toString(),
              style: TextStyle(fontSize: 32.0, color: color)),
        ),
        IconButton(icon: Icon(Icons.clear), onPressed: _onClicked)
      ],
    );
  }
}
