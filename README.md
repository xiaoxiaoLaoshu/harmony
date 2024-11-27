# harmony
This is a harmony Dome,write everything about harmony
## 项目工程搭建背景：通过 DevEco Studio 编辑器，创建ArkTS工程。
## 使用的技术为：
- 基于ArkTS的声明式开发范式
- HarmonyOS API 9开始新增的模型，是目前主推且会长期演进的模型。在该模型中，由于提供了AbilityStage、WindowStage等类作为应用组件和Window窗口的“舞台”，因此称这种应用模型为Stage模型。
### 待补充的名词解释
1. 什么是 ArkTS
2. 什么是 AbilityStage、WindowStage
## 工程结构描述：
- AppScope > app.json5：应用的全局配置信息，详见app.json5配置文件。
- entry：HarmonyOS工程模块，编译构建生成一个HAP包。
- src > main > ets：用于存放ArkTS源码。
- src > main > ets > entryability：应用/服务的入口。
- src > main > ets > entrybackupability：应用提供扩展的备份恢复能力。
- src > main > ets > pages：应用/服务包含的页面。
- src > main > resources：用于存放应用/服务所用到的资源文件，如图形、多媒体、字符串、布局文件等。关于资源文件，详见资源分类与访问。
- src > main > module.json5：模块配置文件。主要包含HAP包的配置信息、应用/服务在具体设备上的配置信息以及应用/服务的全局配置信息。具体的配置文件说明，详见module.json5配置文件。
- build-profile.json5：当前的模块信息 、编译信息配置项，包括buildOption、targets配置等。
- hvigorfile.ts：模块级编译构建任务脚本。
- obfuscation-rules.txt：混淆规则文件。混淆开启后，在使用Release模式进行编译时，会对代码进行编译、混淆及压缩处理，保护代码资产。详见开启代码混淆。
- oh-package.json5：用来描述包名、版本、入口文件（类型声明文件）和依赖项等信息。
- oh_modules：用于存放三方库依赖信息。
- build-profile.json5：工程级配置信息，包括签名signingConfigs、产品配置products等。其中products中可配置当前运行环境，默认为HarmonyOS。
- hvigorfile.ts：工程级编译构建任务脚本。
- oh-package.json5：主要用来描述全局配置，如：依赖覆盖（overrides）、依赖关系重写（overrideDependencyMap）和参数化配置（parameterFile）等。