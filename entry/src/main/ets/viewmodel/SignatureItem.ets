export class SignatureItem {
  name: Resource = $r('app.string.empty');
  type: string = '';
  keyGenAlg: string = '';
  isSegment: boolean = false;

  constructor(name: Resource, type: string, keyGenAlg: string, isSegment: boolean) {
    this.name = name;
    this.type = type;
    this.keyGenAlg = keyGenAlg;
    this.isSegment = isSegment;
  }
}