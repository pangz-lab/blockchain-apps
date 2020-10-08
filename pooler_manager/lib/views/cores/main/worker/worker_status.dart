import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:io';

class WorkerStatus extends StatefulWidget {
  static final routeName = '/worker/status';
  @override
  _WorkerStatusState createState() => _WorkerStatusState();
}

class _WorkerStatusState extends State<WorkerStatus> {
  // String message = "Run process";
  // String logPath = 'C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon\\stat.log';
  // String cmd = 'cd C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon && mine-out.bat > stat.log >2&1';
  // String cmd = 'cd C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon && start mine-out.bat';
  String cmd = 'cd C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon && start mine-out.bat';
  String wd = 'C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon';
  // String cmd = 'cd C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon';
  int processId;
  Widget statusTerminal;
  bool minerRunning;

  @override
  initState() {
    print("initState");
    super.initState();
    // statusTerminal = Text('Miner not running');
    statusTerminal = StatusTerminal();
    minerRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    print("build>> ");
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Status'),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              child: Text((!minerRunning) ? "Run Miner" : "Stop Miner"),
              onPressed: () {
                print('onpressed');
                if(!minerRunning) {
                  runMiner();
                } else {
                  killMiner();
                }                
              },
            ),            
            Text(processId.toString()),
            statusTerminal
          ],
        ),
        
      )
    );    
  }

  
  runMiner() async {
    print("Run miner");
    /*
    var proc = await Process.run(cmd, [], runInShell: true);
    print("After process");
    print(proc.pid);
    */
    var proc = Process.run(cmd, [], workingDirectory: wd, runInShell: true).then((result) {
    // var proc = Process.run("mine-out.bat", [], workingDirectory: wd, runInShell: true).then((result) {
    // var proc = Process.run("start",["mine-out.bat", "/b"], workingDirectory: wd, runInShell: true).then((result) {
    
      print("inside process");
      stdout.write(result.stdout);
      stderr.write(result.stderr);
      processId = result.pid;
      print(result.pid.toString());
    });

    print("outside process");
    print("before kill process");
    
    print("after kill process");    
    setState(() {
      statusTerminal =  StatusTerminal();
      minerRunning = true;
    });
  
  }

  killMiner() {
    print("Kill miner");
    Process.killPid(processId);
    setState(() {
      minerRunning = false;
    });
  }
}

class StatusTerminal extends StatefulWidget {
  @override
  _StatusTerminalState createState() => _StatusTerminalState();
}

class _StatusTerminalState extends State<StatusTerminal> {
  String message = "Run process";
  String logPath = 'C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon\\mine-out.log';
  Timer timer;
  @override
  void initState() {
    super.initState();
    setUpTimedLogFetch();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }

  setUpTimedLogFetch() {
    timer = Timer.periodic(Duration(milliseconds: 5000), (timer) {
      logContent().then((String c) {
        setState(() {
          message = c ?? 'erer';
        });
      });
    });
  }

  Future<String> logContent() async {
    try {
      final file = File(logPath);

      // Read the file
      String fc = await file.readAsString();
      print(fc.length);
      return fc.substring((fc.length < 500)? fc.length : fc.length - 500);
    } catch (e) {
      return 'empty';
    }
  }
}