import 'dart:convert';
import 'dart:typed_data';
import 'bip39.dart' as bip39;

class Mnemonic {

  List<String> words;

  Mnemonic() {
    var wordString = generateWordString();
    this.words = wordString.split(" ");
  }

  Mnemonic.fromKeyString(String wordString) {

    if (!this._validateWords(wordString)) {
      this.words = [];
      return;
    }
    this.words = wordString.split(" ");
  }

  Mnemonic.fromKeys(List<String> words) {
    this.words = words;
    if (!this._validateWords(this.string())) {
        this.words = [];
    }
  }

  String newWords() {
    var wordString = generateWordString();
    this.words = wordString.split(" ");
  }

  String generateWordString() {
     var wordString =  bip39.generateMnemonic();
     return wordString;
  }

  bool _validateWords(String wordString) {
    var isValid = bip39.validateMnemonic(wordString);
    return isValid;
  }

  bool isValid() {
    if (this.words.length == 0) {
      return false;
    }

    var isValid = _validateWords(this.string());
    return isValid;
  }

  String string() {
    return words.join(' ');
  }

  Uint8List bytes() {
    return utf8.encode(this.toString());
  }

  Uint8List seed() {
    return bip39.mnemonicToSeed(this.string());
  }

  String seedHex() {
    return bip39.mnemonicToSeedHex(this.string());
  }

  String entropy() {
    return bip39.mnemonicToEntropy(this.string());
  }
}