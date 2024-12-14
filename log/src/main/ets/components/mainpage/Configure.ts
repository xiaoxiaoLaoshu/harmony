import { LogLevel } from './LogLevel'

export type Configure = {
  cheess: {
    types: string[],
    filename?: string,
  },
  defaults: {
    appenders: string,
    level: LogLevel
  }
}