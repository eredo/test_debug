import 'package:barback/barback.dart';
import 'package:path/path.dart' as path;

/// A pub serve transformer that provides a basic HTML file for dart tests in
/// order to debug them in dartium or Intellij.
class TestDebugPubServeTransformer extends Transformer
    implements DeclaringTransformer {
  @override
  final String allowedExtensions = '.dart';

  TestDebugPubServeTransformer.asPlugin();

  @override
  void apply(Transform transform) {
    transform.addOutput(new Asset.fromString(
        transform.primaryInput.id.addExtension('.debug.html'),
        '''
<html>

<body>
    <script type="application/dart" src="${path.basename(transform.primaryInput.id.path)}"></script>
    <script src="packages/browser/dart.js"></script>
    <script src="packages/test/dart.js"></script>
    <link rel="x-dart-test" href="${path.basename(transform.primaryInput.id.path)}">
</body>
</html>
    '''));
  }

  @override
  void declareOutputs(DeclaringTransform transform) {
    transform.declareOutput(transform.primaryId.addExtension('.debug.html'));
  }
}
