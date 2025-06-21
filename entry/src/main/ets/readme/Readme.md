# HMRouter

https://blog.csdn.net/superherowupan/article/details/143056088

# Navigation 配置

https://juejin.cn/post/7448184448841891891

### 根容器Navigation

1、根容器需要Navigation最为容器组件；
2、配置NavPathStack变量

### 子容器

1、子页面需要使用NavDestination作为根容器
2、引起跟容器的NavPathStack变量
3、对外暴露的构建函数

```
@Builder
export function subPageBuilder() {
  SecondPage()
}
```

### 路由表

1、在resource-》base-》profile目录下新建route_map.json文件

```
{
  "routerMap": [
    {
      "name": "PageOne",
      "pageSourceFile": "src/main/ets/pages/SecondPage.ets",
      "buildFunction": "subPageBuilder",
      "data": {
        "description": "this is PageOne"
      }
    }
  ]
}
```

2、在跳转目标模块的配置文件module.json5添加路由表配置：

```
"routerMap": "$profile:router_map",
```