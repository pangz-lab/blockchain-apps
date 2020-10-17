import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pooler_manager/views/defaults/app_card_standard.dart';
import 'package:pooler_manager/views/defaults/app_card_thin.dart';
import 'dart:io';

import 'package:pooler_manager/views/defaults/app_scaffold.dart';

class ProcessStatusView extends StatefulWidget {
  static const routeName = '/process/status';
  @override
  _ProcessStatusViewState createState() => _ProcessStatusViewState();
}

class _ProcessStatusViewState extends State<ProcessStatusView> {
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
        title: Text('Process Status'),
      ),
      body: AppCardStandard(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10,20,10,10),
                width: 600.0,
                height: 200.0,
                child: statusTerminal,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
              ),
              // AppCardThin(
              //   child: statusTerminal
              // ),
              // ElevatedButton(
              //   child: Text((!minerRunning) ? "Run Miner" : "Stop Miner"),
              //   onPressed: () {
              //     print('onpressed');
              //     if(!minerRunning) {
              //       runMiner();
              //     } else {
              //       killMiner();
              //     }                
              //   },
              // ),            
              // Text(processId.toString()),
            ],
          ),
        ),
      )
    );
  }

  
  runMiner() async {
    print("Run miner");
    Process.run(cmd, [], workingDirectory: wd, runInShell: true).then((result) {
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
  String message = "Loading the process log....\n[ Please wait ]";
  String logPath = 'C:\\Users\\pangz\\OneDrive\\Documents\\Pitaka\\Apps\\modules\\hellminer_cpu_win64_avx-xeon\\mine-out.log';
  Timer timer;
  int logLength = 500;
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
    return Text(
      message,
      overflow: TextOverflow.visible,
      style: TextStyle(color: Colors.white),
    );
  }

  setUpTimedLogFetch() {
    timer = Timer.periodic(Duration(milliseconds: 5000), (timer) {
      logContent().then((String c) {
        setState(() {
          message = c ?? 'Error loading the log...';
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
      return fc.substring((fc.length < logLength)? fc.length : fc.length - logLength);
    } catch (e) {
      return 'empty';
    }
  }
}