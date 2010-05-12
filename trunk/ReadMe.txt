说明：
---许润华

1.数据持久化（操作数据库，存储数据）
	a.关于数据持久化方面的类放在com.goodfriend.service.impl包中
	     调用相应的类的方法即可
	b.不允许更改和调用com.goodfriend.dao.impl包中的类
	c.如有需要添加访问数据库自己的个性化方法时，
	    在com.goodfriend.service包中写接口，com.goodfriend.service.impl实现类
	    为了使你的方法能够事务管理，请根据方法功能按如下规则命名你的方法：
	  C(创建)----add*
	  R(读取)----get*
	  U(更新)----update*
	  D(删除)----del*
    
2.关于Spring2.5的说明
	a.系统采用Spring的IoC容器统一管理所有的JavaBean,以避免代码之间的紧耦合
		依赖注入原则        面向接口编程
	b.系统管理部分的Spring配置放在文件applicationContext-admin.xml
	c.系统管理部分的Struts配置文件为struts_admin.xml
	
3.数据库说明
	系统采用MySQL 5.0数据库
	获得项目后，在根目录下有gf*.sql文件，导入即可
	导入方法：
	打开控制台：cmd
	输入：mysql -uroot -p你的数据库密码  < sql文件地址
	（f.g.  mysql -uroot -pxurunhua < e:\gf0505.sql）
	修改项目中的hibernate.cfg.xml中的数据库配置密码为你自己的就好
4.关于持久化部分的Javadoc注释，我会尽快更新,如有其它问题联系我