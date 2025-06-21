/**
 * @author wlz
 * @since 2025−05-06
 * @description:
 */

/**
 * @Param支持本地初始化，也可以从外部初始化;
 * @Param若不在本地初始化，则需要和@Require装饰器一起使用，表示必须要从外面初始化
 * @Parma不允许在组件内部直接修改变量本身;
 * 当外部初始化的数据源也是状态变量时，数据源的修改会同步给@Param（类似于指针拷贝）
 */

/**
 * @once
 * 1、@once不能单独使用，必须搭配@Param一起使用；
 * 2、once仅初始化时同步数据源一次，之后不再继续同步变化；
 * 3、@once+@param时，本地可以修改变量，相当于@Local，只是多一个可以外部初始化变量功能
 */

/**
 * @event：用来实现父组件与子组件的双向同步，表明子组件需要传入更新数据源的回调。
 *
 * @Event用于装饰组件对外输出的方法：
 *
 */
@ComponentV2
export struct Child {
  // 组件的外部输入，不允许在组件内部修改
  @Param count: number = 1
  // 本地没有初始化，则必须从外面初始化，加上@Require
  @Require @Param message: string;
  // 仅在初始化的时候接受外部变量，不接受后续同步变化的能力，本地可以修改变量
  // @once+@param = @local+外部初始化
  @Once @Param flag: boolean = false;
  // Param代表组件的输入，Event代表组件的输出，父组件决定是否需要跟新子组件
  @Event changeValue: (x: number) => void = (x: number) => {
  }

  build() {
    Column() {
      Text(`Param ${this.count}`)
      Text(`Param ${this.message}`)
      Text(`Param ${this.flag}`)

      Button("change")
        .onClick(() => {
          // @Param 本地不能修改
          // this.count++
          this.flag = !this.flag
          this.changeValue(this.count)
        })
    }
  }
}