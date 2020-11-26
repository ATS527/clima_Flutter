import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  test1();
  String taskblah = await test2();
  test3(taskblah);
}

void test1() {
  print("Test 1 completed");
}

Future<String> test2() async {
  String task;
  Duration duration = Duration(seconds: 3);
  await Future.delayed(duration, () {
    sleep(duration);
    task = "Task Completed";
    print("Test 2 completed");
  });
  return task;
}

void test3(String task) {
  print("Test 3 completed $task");
}
