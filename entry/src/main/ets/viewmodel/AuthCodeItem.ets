export class AuthCodeItem {
  name: Resource = $r('app.string.empty');

  constructor(name: Resource) {
    this.name = name;
  }
}