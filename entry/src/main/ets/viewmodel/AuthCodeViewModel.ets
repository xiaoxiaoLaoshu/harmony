import { AuthCodeItem } from './AuthCodeItem';

export class AuthCodeViewModel {
  public static getCodeList(): AuthCodeItem[] {
    let AuthCodeList: AuthCodeItem[] = [];
    AuthCodeList.push(new AuthCodeItem($r('app.string.calculate_code')));
    AuthCodeList.push(new AuthCodeItem($r('app.string.calculate_seg_code')));

    return AuthCodeList;
  }
}