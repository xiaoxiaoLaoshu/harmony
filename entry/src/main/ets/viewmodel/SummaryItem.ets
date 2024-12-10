export class SummaryItem {
  name: Resource = $r('app.string.empty');
  type: string = '';

  constructor(name: Resource, type: string) {
    this.name = name;
    this.type = type;
  }
}