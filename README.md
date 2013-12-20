
个人博客系统<br>
演示地址：http://hcmin.cfapps.io<br>
介绍：<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本项目采用多层架构，包括表现层、业务层和数据访问层，层次间的依赖关系自下到上。采用的技术有SpringMVC，Spring，MyBatis，Log4J，C3P0，Junit 等。其中表现层采用MVC框架是SpringMVC,SpringMVC简洁优雅，支持Restful； 业务层封装业务流程，为适应业务的变更，每一业务模块均有专门的接口及实现类，利用Spring的IoC功能将实现类注入给控制层的Controller；数据访问层借助于MyBatis实现，MyBatis只是对JDCB轻量级的封装，用XML文件对SQL进行管理，程序执行效率更高。事务部分利用Spring的声明式事务进行事务管理。本项目功能分为前台展示功能和后台管理功能。前台包括：发表浏览博客；对博客进行评论；按年月进行归档；显示最新文章等；后台包括：文章管理；分类管理；友情链接管理；用户及权限管理等。
