# covearge issue


- 1.2.0 could not run test 

Dart SDK version: 2.17.0 (stable) not support 

```s
dart --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=NNNN script.dart
pub global run coverage:collect_coverage --uri=http://... -o coverage.json --resume-isolates --function-coverage

```
- error
```
jiodg45@jiodg45s-MacBook-Pro dart_package % dart --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=NNNN script.dart
Error when reading 'script.dart': No such file or directory.
jiodg45@jiodg45s-MacBook-Pro dart_package % dart --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=NNNN script.dart
Error when reading 'script.dart': No such file or directory.
jiodg45@jiodg45s-MacBook-Pro dart_package % dart --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 script.dart
Error when reading 'script.dart': No such file or directory.
```

dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test && collect_coverage --uri=http://127.0.0.1:8181 -o coverage.json --resume-isolates


## Fixed command

- normal(got coverage.json successfully)
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test
collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates
format_coverage --packages=.packages -i coverage/coverage.json

- function test

dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test
collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --function-coverage --branch-coverage
format_coverage --packages=.packages -i -lcov -i coverage/coverage.json -o coverage/lcov.info

- converte converage.json to lcov.info
format_coverage --packages=.dart_tool/package_config.json --lcov -i raw-coverage.json -o coverage/lcov.info



## function-coverage collection failed

data is too largable，aways came to a dead loop like this below

failed, got a dead lock with five miniutes later, 

```dart
line mapping for script package:collection/src/queue_list.darttokenPos 8711 has no line mapping for script package:collection/src/queue_list.darttokenPos 9236 has no line mapping for script package:collection/src/queue_list.darttokenPos 9561 has no line mapping for script package:collection/src/queue_list.darttokenPos 9851 has no line mapping for script package:collection/src/queue_list.darttokenPos 9925 has no line mapping for script package:collection/src/queue_list.darttokenPos 9998 has no line mapping for script package:collection/src/queue_list.darttokenPos 10509 has no line mapping for script package:collection/src/queue_list.darttokenPos 10767 has no line mapping for script package:collection/src/queue_list.darttokenPos 10985 has no line mapping for script package:collection/src/queue_list.darttokenPos 11333 has no line mapping for script package:collection/src/queue_list.darttokenPos 11395 has no line mapping for script package:collection/src/queue_list.darttokenPos 11456 has no line mapping for script package:collection/src/queue_list.darttokenPos 11737 has no line mapping for script package:collection/src/queue_list.darttokenPos 11893 has no line mapping for script package:collection/src/queue_list.darttokenPos 12054 has no line mapping for script package:collection/src/queue_list.darttokenPos 12395 has no line mapping for script package:collection/src/queue_list.darttokenPos 13365 has no line mapping for script package:collection/src/queue_list.darttokenPos 14611 has no line mapping for script package:collection/src/queue_list.darttokenPos 14805 has no line mapping for script package:collection/src/queue_list.darttokenPos 15002 has no line mapping for script package:collection/src/queue_list.darttokenPos 15320 has no line mapping for script package:collection/src/queue_list.darttokenPos 15641 has no line mapping for script package:collection/src/queue_list.darttokenPos 15948 has no line mapping for script package:collection/src/queue_list.darttokenPos 16059 has no line mapping for script package:collection/src/queue_list.darttokenPos 17248 has no line mapping for script package:collection/src/queue_list.darttokenPos 17484 has no line mapping for script package:collection/src/queue_list.darttokenPos 10866 has no line mapping for script package:collection/src/queue_list.darttokenPos -1 has no line mapping for script package:test_api/src/backend/test.darttokenPos 1206 has no line mapping for script package:test_core/src/runner/load_suite.darttokenPos -9 has no line mapping for script package:test_core/src/runner/reporter/compact.darttokenPos -9 has no line mapping for script package:test_core/src/runner/reporter/compact.darttokenPos -1 has no line mapping for script package:test_core/src/runner
...
```