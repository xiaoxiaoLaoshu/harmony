export class CryptoItem {
  name: Resource = $r('app.string.empty');
  encrypted: Resource = $r('app.string.empty');
  decrypted: Resource = $r('app.string.empty');
  type: string = '';

  constructor(name: Resource, encrypted: Resource, decrypted: Resource, type: string) {
    this.name = name;
    this.encrypted = encrypted;
    this.decrypted =decrypted;
    this.type = type;
  }
}