import { SignatureItem } from './SignatureItem';

export class SignatureViewModel {
  public static getSignatureList(): SignatureItem[] {
    let SignatureList: SignatureItem[] = [];
    SignatureList.push(new SignatureItem($r('app.string.rsa_pkcs1'), 'RSA1024|PKCS1|SHA256', 'RSA1024', false));
    SignatureList.push(new SignatureItem($r('app.string.rsa_pkcs1_seg'), 'RSA1024|PKCS1|SHA256', 'RSA1024', true));
    SignatureList.push(new SignatureItem($r('app.string.rsa_pass'), 'RSA|PASS|SHA256|MGF1_SHA256', '', false));
    SignatureList.push(new SignatureItem($r('app.string.ecdsa'), 'ECC256|SHA256', 'ECC256', false));
    SignatureList.push(new SignatureItem($r('app.string.sm2'), 'SM2_256|SM3', 'SM2_256', false));

    return SignatureList;
  }
}