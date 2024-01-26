import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'clientId')
  static final String clientId = _Env.clientId;
  @EnviedField(varName: 'clientSecret')
  static final String clientSecret = _Env.clientSecret;
  @EnviedField(varName: 'githubRedirectUrl')
  static final String githubRedirectUrl = _Env.githubRedirectUrl;
  @EnviedField(varName: 'githubUrl')
  static final String githubUrl = _Env.githubUrl;
}
