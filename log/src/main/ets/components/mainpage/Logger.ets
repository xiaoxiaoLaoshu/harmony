import { fileIo } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { Configure } from './Configure';
import { LogLevel } from './LogLevel';
import { LoggerModel } from './LoggerModel';
import { hilog } from '@kit.PerformanceAnalysisKit';

interface ILoggerStrategy {
  debug(message: string): void

  info(message: string): void

  warn(message: string): void

  error(message: string): void

  fatal(message: string): void
}

class ConsoleLoggerStrategy implements ILoggerStrategy {
  private configure: Configure;
  private domain: number;

  constructor(configure: Configure) {
    this.configure = configure;
    this.domain = 0xFF00;
  }

  public debug(message: string): void {
    hilog.debug(this.domain, this.configure.defaults.appenders, message);
  }

  public warn(message: string): void {
    hilog.warn(this.domain, this.configure.defaults.appenders, message);
  }

  public info(message: string): void {
    hilog.info(this.domain, this.configure.defaults.appenders, message);
  }

  public error(message: string): void {
    hilog.error(this.domain, this.configure.defaults.appenders, message);
  }

  public fatal(message: string): void {
    hilog.fatal(this.domain, this.configure.defaults.appenders, message);
  }
}

class HilogLoggerStrategy implements ILoggerStrategy {
  private configure: Configure;
  private loggerModel: LoggerModel;

  constructor(configure: Configure) {
    this.configure = configure;
    this.loggerModel = new LoggerModel(`${configure.defaults.appenders}`);
  }

  public debug(message: string): void {
    this.loggerModel.debug(`[DEBUG] ${this.configure.defaults.appenders} - `, `${message}`);
  }

  public info(message: string): void {
    this.loggerModel.info(`[INFO] ${this.configure.defaults.appenders} - `, `${message}`);
  }

  public warn(message: string): void {
    this.loggerModel.warn(`[WARN] ${this.configure.defaults.appenders} - `, `${message}`);
  }

  public error(message: string): void {
    this.loggerModel.error(`[ERROR] ${this.configure.defaults.appenders} - `, `${message}`);
  }

  public fatal(message: string): void {
    this.loggerModel.fatal(`[FATAL] ${this.configure.defaults.appenders} - `, `${message}`);
  }
}

class FileLoggerStrategy implements ILoggerStrategy {
  private fd: number = 0;
  private configure: Configure;
  private fileStream?: fileIo.File;

  constructor(configure: Configure, context: common.UIAbilityContext) {
    // Initialization file.
    this.configure = configure;
    let path = context.filesDir;
    let result = `${path}/${this.configure.chesse.filename}`;
    try {
      this.fileStream = fileIo.openSync(result, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      this.fd = this.fileStream.fd;
    } catch (err) {
      return;
    }
  }

  private async writeFile(message: string) {
    // Write a document.
    fileIo.writeSync(this.fd, `${message}\n`);
    // fs.closeSync(this.fileStream)
    // this.fileStream.closeSync()
  }

  public async debug(message: string): Promise<void> {
    await this.writeFile(`[DEBUG] ${this.configure.defaults.appenders}, ${message}`);
  }

  public async info(message: string): Promise<void> {
    await this.writeFile(`[INFO] ${this.configure.defaults.appenders}, ${message}`);
  }

  public async warn(message: string): Promise<void> {
    await this.writeFile(`[WARN] ${this.configure.defaults.appenders}, ${message}`);
  }

  public async error(message: string): Promise<void> {
    await this.writeFile(`[ERROR] ${this.configure.defaults.appenders}, ${message}`);
  }

  public async fatal(message: string): Promise<void> {
    await this.writeFile(`[FATAL] ${this.configure.defaults.appenders}, ${message}`);
  }
}

export class Logger {
  private configure: Configure = new Configure([''], '', '', LogLevel.DEBUG);
  private loggerModel: LoggerModel = new LoggerModel(`${this.configure.defaults.appenders}`);
  private strategies: Map<string, ILoggerStrategy> = new Map();
  private context: common.UIAbilityContext;

  constructor(context: common.UIAbilityContext) {
    console.info(JSON.stringify(context),'content1111111111111')
    this.context = context;
  }

  public setConfigture(configure: Configure) {
    this.strategies = new Map();
    this.configure = configure;
    this.loggerModel = new LoggerModel(`${configure.defaults.appenders}`);
    if (!configure || !configure.chesse || !configure.chesse.types) {
      return;
    }
    if (configure.chesse.types.includes('file')) {
      this.strategies.set('file', new FileLoggerStrategy(configure, this.context));
    }
    if (configure.chesse.types.includes('hilog')) {
      this.strategies.set('hilog', new HilogLoggerStrategy(configure));
    }
    if (configure.chesse.types.includes('console') || this.strategies.size <= 0) {
      this.strategies.set('console', new ConsoleLoggerStrategy(configure));
    }
  }

  public debug(message: string): void {
    let levelCheck = this.loggerModel.isLoggable(this.configure.defaults.appenders, LogLevel.DEBUG);
    if (levelCheck && this.configure.defaults.level <= LogLevel.DEBUG) {
      this.strategies.forEach((value, key) => {
        this.strategies?.get(key)?.debug(message);
      })
    }
  }

  public info(message: string): void {
    let levelCheck = this.loggerModel.isLoggable(message, LogLevel.INFO);
    if (levelCheck && this.configure.defaults.level <= LogLevel.INFO) {
      this.strategies.forEach((value, key) => {
        this.strategies?.get(key)?.info(message);
      })
    }
  }

  public warn(message: string): void {
    let levelCheck = this.loggerModel.isLoggable(message, LogLevel.WARN);
    if (levelCheck && this.configure.defaults.level <= LogLevel.WARN) {
      this.strategies.forEach((value, key) => {
        this.strategies.get(key)?.warn(message);
      })
    }
  }

  public error(message: string): void {
    let levelCheck = this.loggerModel.isLoggable(message, LogLevel.ERROR);
    if (levelCheck && this.configure.defaults.level <= LogLevel.ERROR) {
      this.strategies.forEach((value, key) => {
        this.strategies.get(key)?.error(message);
      })
    }
  }

  public fatal(message: string): void {
    let levelCheck = this.loggerModel.isLoggable(message, LogLevel.FATAL);
    if (levelCheck && this.configure.defaults.level <= LogLevel.FATAL) {
      this.strategies.forEach((value, key) => {
        this.strategies.get(key)?.fatal(message);
      })
    }
  }
}