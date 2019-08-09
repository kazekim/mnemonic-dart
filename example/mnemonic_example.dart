import 'package:mnemonic_dart/mnemonic_dart.dart';

main() {
  var mnemonic = Mnemonic();
  print(mnemonic.string());

  var mnemonic2 = Mnemonic.fromKeyString("movie more awful town grow muscle tube wink door appear crucial exchange drama setup senior section short canyon water volume october stable glide knife");
  if (mnemonic2.isValid()) {
    print(mnemonic2.seedHex());
  }
}