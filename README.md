## 本项目实现的最终作用是基于JSP在线旅游美食展现管理系统
## 分为2个角色
### 第1个角色为管理员角色，实现了如下功能：
 - 修改密码
 - 景点管理
 - 查看收藏数据
 - 用户管理
 - 管理员登录
 - 美食管理
### 第2个角色为用户角色，实现了如下功能：
 - 修改个人资料
 - 查看我的收藏
 - 查看景点详情
 - 查看美食详情
 - 查看附近美食
 - 查看首页
 - 用户登录
## 数据库设计如下：
# 数据库设计文档

**数据库名：** zxmszssys

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [base_area](#base_area) | 统一地区库 |
| [cllent](#cllent) | 这是一个客户登记表！ |
| [food](#food) |  |
| [foo_collect](#foo_collect) | 这是用户收藏表 |
| [scenic](#scenic) |  |
| [sce_collect](#sce_collect) | 这是用户收藏表 |
| [users](#users) | 这是user表 |

**表名：** <a id="base_area">base_area</a>

**说明：** 统一地区库

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | base_areaid |   int   | 10 |   0    |    N     |  Y   |       | 地址ID  |
|  2   | name |   varchar   | 255 |   0    |    N     |  N   |   ''    | 地区名字  |
|  3   | parentid |   int   | 10 |   0    |    N     |  N   |   0    | 上级路径ID  |
|  4   | vieworder |   int   | 10 |   0    |    N     |  N   |   0    | 顺序  |

**表名：** <a id="cllent">cllent</a>

**说明：** 这是一个客户登记表！

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | cll_id |   int   | 10 |   0    |    N     |  Y   |       | 用户主键  |
|  2   | cll_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 姓名  |
|  3   | ctel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 登录账号  |
|  4   | password |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户密码  |
|  5   | id_code |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 身份识别码（用于找回密码）  |
|  6   | csex |   varchar   | 2 |   0    |    Y     |  N   |   NULL    | 性别  |
|  7   | age |   int   | 10 |   0    |    Y     |  N   |   NULL    | 年龄  |

**表名：** <a id="food">food</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | foo_id |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | foo_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 美食名称  |
|  3   | sce_id |   int   | 10 |   0    |    Y     |  N   |   NULL    | 景区ID  |
|  4   | img_url |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 图片地址  |
|  5   | address |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地址  |
|  6   | description |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 描述  |

**表名：** <a id="foo_collect">foo_collect</a>

**说明：** 这是用户收藏表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | col_id |   int   | 10 |   0    |    N     |  Y   |       | 收藏美食主键  |
|  2   | foo_id |   int   | 10 |   0    |    Y     |  N   |   NULL    | 美食id  |
|  3   | ctel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户账号  |

**表名：** <a id="scenic">scenic</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | sce_id |   int   | 10 |   0    |    N     |  Y   |       | 景区Id  |
|  2   | sce_name |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 景区名称  |
|  3   | region_id |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 地区编号  |
|  4   | address |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 详细地区  |
|  5   | img_url |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 图片地址  |
|  6   | description |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 描述  |

**表名：** <a id="sce_collect">sce_collect</a>

**说明：** 这是用户收藏表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | col_id |   int   | 10 |   0    |    N     |  Y   |       | 收藏景区主键  |
|  2   | sce_id |   int   | 10 |   0    |    Y     |  N   |   NULL    | 景点id  |
|  3   | ctel |   varchar   | 255 |   0    |    Y     |  N   |   NULL    | 用户账号  |

**表名：** <a id="users">users</a>

**说明：** 这是user表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | uname |   varchar   | 255 |   0    |    N     |  Y   |       | 用户名  |
|  2   | password |   varchar   | 64 |   0    |    Y     |  N   |   NULL    | 密码  |
|  3   | utype |   int   | 10 |   0    |    Y     |  N   |   NULL    | 用户类型  |

**运行不出来可以微信 javape 我的公众号：源码码头**
