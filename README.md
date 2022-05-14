## Fork 
This is a fork of the package https://pub.dev/packages/logging.  
Redesigned logging level to TDIWEF style - trace, debug, info, warn, error, fatal
## Initializing
By default, the logging package does not do anything useful with the log
messages. You must configure the logging level and add a handler for the log
messages.

Here is a simple logging configuration that logs all messages via `print`.

```dart
Logger.root.level = Level.ALL; // defaults to Level.INFO
Logger.root.onRecord.listen((record) {
  print('${record.level.name}: ${record.time}: ${record.message}');
});
```

First, set the root `Level`. All messages at or above the current level are sent to the
`onRecord` stream. Available levels are:

+ `Level.OFF`
+ `Level.FATAL`
+ `Level.ERROR`
+ `Level.WARNING`
+ `Level.INFO`
+ `Level.DEBUG`
+ `Level.TRACE`

Then, listen on the `onRecord` stream for `LogRecord` events. The `LogRecord`
class has various properties for the message, error, logger name, and more.

## Logging messages

Create a `Logger` with a unique name to easily identify the source of the log
messages.

```dart
final log = Logger('MyClassName');
```

Here is an example of logging a debug message and an error:

```dart
var future = doSomethingAsync().then((result) {
  log.debug('Got the result: $result');
  processResult(result);
}).catchError((e, stackTrace) => log.error('Oh noes!', e, stackTrace));
```

When logging more complex messages, you can pass a closure instead that will be
evaluated only if the message is actually logged:

```dart
log.trace(() => [1, 2, 3, 4, 5].map((e) => e * 4).join("-"));
```

Available logging methods are:

+ `log.fatal(logged_content);` or `log.f(logged_content);`
+ `log.error(logged_content);` or `log.e(logged_content);`
+ `log.warn(logged_content);`  or `log.w(logged_content);`
+ `log.info(logged_content);`  or `log.i(logged_content);`
+ `log.denug(logged_content);` or `log.d(logged_content);`
+ `log.trace(logged_content);` or `log.t(logged_content);`
