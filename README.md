`test_debug` is a pub transformer which provides `.debug.html` files for dart tests when using `pub serve`. These can
be opened in dartium for debug purposes.

[![Build Status](https://travis-ci.org/eredo/test_debug.svg?branch=master)](https://travis-ci.org/eredo/test_debug)

## Setup

Add `test_debug` to your pubspec.yaml:

```yaml
name: test_debug_example

dev_dependencies:
  test: any
  test_debug: any

transformers:
# Place test_debug before test/pub_serve to avoid unnecessary generated html files
- test_debug:
    $include: test/**_test.dart

- test/pub_serve:
   $include: test/**_test.dart
```


### Using with angular_test

There's no real difference. Just make sure to apply all `angular` and `angular_test` specific transformers.

```yaml
name: test_debug_example
dependencies:
  browser: any
  angular2: '3.0.0-alpha+1'

dev_dependencies:
  angular_test: '1.0.0-beta+1'
  test: any
  test_debug: any

transformers:
# Run the code generator on the entire package.
- angular2/transform/codegen

# Run the reflection remover on tests that have AoT enabled.
- angular2/transform/reflection_remover:
   $include:
       - test/angular_test.dart

- test_debug:
    $include: test/**_test.dart

- test/pub_serve:
   $include: test/**_test.dart
```

## Testing

After running `pub serve` you can open the debug files in dartium: `http://localhost:8081/your_test.dart.debug.html`.
Notice that port `8081` is the default port used by `pub serve` if a `web/` directory exists. Check the output of
`pub serve` to see on which port your tests are available.