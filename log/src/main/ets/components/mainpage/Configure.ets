import { LogLevel } from './LogLevel';

class cheesestruct {
  types: Array<string> = [];
  filename?: string = '';
}

class defaultsstruct {
  appenders: string = '';
  level: LogLevel = LogLevel.DEBUG
}

export class Configure{
  public chesse: cheesestruct = { types: [], filename: ""};
  public defaults: defaultsstruct = { appenders: "", level: LogLevel.DEBUG };

  constructor(types: Array<string>, filename: string, appenders: string, level: LogLevel) {
    this.chesse.type = types;
    this.chesse.filename = filename;
    this.defaults.appenders = appenders;
    this.defaults.level = level;
  }
}