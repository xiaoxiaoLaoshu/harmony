import { SummaryItem } from './SummaryItem';

export class SummaryViewModel {
  public static getSummaryList(): SummaryItem[] {
    let SummaryList: SummaryItem[] = [];
    SummaryList.push(new SummaryItem($r('app.string.SHA256'), 'SHA256'));
    SummaryList.push(new SummaryItem($r('app.string.SHA256Segments'), 'SHA256Segments'));
    SummaryList.push(new SummaryItem($r('app.string.MD5'), 'MD5'));
    SummaryList.push(new SummaryItem($r('app.string.SM3'), 'SM3'));

    return SummaryList;
  }
}