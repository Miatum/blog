/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-10-30 00:25:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type_id` int(4) DEFAULT NULL,
  `tag_id` int(4) DEFAULT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `blog_type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('0003', 'SVG绘制字母', '在设计博客logo时想着一切从简，既然别人的样式我都能copy，logo为啥不行。不过毫不相干的logo用起来也确实勉强，就打算照猫画虎，于是SVG就绕不开了。', '/pic/blogpic/58956a8263f647deab9951948c711c97.jpg', '1', '17', 'miatum', '2020-10-02 14:07:34', '# SVG 指可伸缩矢量图形 (Scalable Vector Graphics)\n在设计博客logo时想着一切从简，既然别人的样式我都能copy，logo为啥不行。不过毫不相干的logo用起来也确实勉强，就打算照猫画虎，于是SVG就绕不开了。\n\n');
INSERT INTO `blog` VALUES ('0004', 'AJAX粗解', '前后端交互的主要方式之一，Form表单方式只要了解相关的HTML组件属性即可使用；而AJAX则主要是Javascript的使用，很多框架也基于原生方法做了封装。', '/pic/blogpic/d43ddf5db7d843bc9b019b88609f73ce.jpg', '1', '11', 'miatum', '2020-10-02 14:09:35', '# Ajax是常用，但是每一次我都要去搜索用法\n###### JavaScript写法\n    var xhr = new HttpRequest()\n    xhr.open(\'POST/GET\' , \'/url\')\n    xhr.send(data)\n###### jQuery写法\n    $.ajax({\n    type : \"POST\",\n    url : \"/url\",\n    contentType : \"application/json\",\n    dataType : \"json\",\n    data : JSON.stringify(data),\n    success : function (result) {\n                    console.log(result);\n                },\n              error : function(e){\n                    console.log(e.status);\n                    console.log(e.responseText);\n              }\n    })\n###### 注意事项\n- 前端需要传空值时，不能赋值成null，交互都是以string进行的，null传到后端即\"null\"。如果该参数为某类的一个属性，传参时直接省略该参数即可，后端参数类型设为该类，此时该属性值会自动解析为空值；\neg: 新增用户，用户id不用传，由数据库自动递增，后端controller：\n```java\n@RequestMapping(\"/addUser\")\npublic String controller(User user){\n	return \"\";\n}\npublic class User{\n	int id;\n	String userName;\n	String password;\n}\n```\n前端form表单形式(省略id`<input>`标签)：\n```html\n<form>\n	<input name=\"userName\">\n	<input name=\"password\">\n</form>\n```\n前端Ajax形式发送JSON：\n```json\n[\"userName\":\"admin\",\"password\":\"123\"]\n```\n前端Ajax形式拼接请求头：\n```javascript\nxhr.open(\'POST\',\'/addUser?id&userName=admin&password=123\')\n//或者直接省略id\nxhr.open(\'POST\',\'/addUser?userName=admin&password=123\')\n```\n- 在传递Json对象时，记得调用JSON.Stringify()函数，将其转成字符串。\n');
INSERT INTO `blog` VALUES ('0005', '范型', '本意是想让方法能够适用于更多类型参数，于是了解到范型。', '/pic/blogpic/2d729e01a4e44242aeca892193507ae7.jpg', '1', '7', 'miatum', '2020-10-02 14:12:17', '在不确定参数具体类型时，可使用范型，达到方法可以接收任何类型的参数，如：\n```java\npublic class DataTransform {\n    public static <T> JSONObject forLayUiTable(List<T> list){\n        /**\n        *@Author: miatum\n        *@Description: 将list按layui数据表格要求格式转JSON,使用范型可以让该方法能同时接收Blog、Blog_Tag、Blog_Type、User\n        *@Date: 8:25 2020/9/28\n        */\n        JSONObject jsonObject=new JSONObject();\n        jsonObject.put(\"code\",0);\n        jsonObject.put(\"count\",list.size());\n        jsonObject.put(\"msg\",\"\");\n        jsonObject.put(\"data\",list);\n        return jsonObject;\n    }\n}\n```');
INSERT INTO `blog` VALUES ('0006', 'Thyme leaf基本操作', 'Thyme leaf是spring boot推荐的模板引擎，其内联表达式可以运用在页面内DOM元素属性、CSS、Javascript里。', '/pic/blogpic/ac35dac3d46c4eeeb73102657060cdde.jpg', '1', '9', 'miatum', '2020-10-02 14:13:01', '# Thymeleaf基本操作\n一个模板引擎罢了，真不熟。\n依赖：\n```xml\n    <dependency>\n    	<groupId>org.springframework.boot</groupId>\n    	<artifactId>spring-boot-starter-thymeleaf</artifactId>\n    </dependency>\n```\n## 问题集锦\n- 在模板中使用layui数据表格时，会出现[[]]连写的情况，但[[]]在thyme leaf中为内联表达式，解决方法:\n[\n[\n]\n]\n就硬换行分开写就行。\n- controller无法跳转页面。犯病情况有很多种：\n1. 1、用了@RestController或者@ResponseBody，这样只能返回字符串。\n2. 2、用Ajax请求，因为用于页面跳转的情况一般只是为了页面初始化带有数据，而Ajax则是数据交互时使用，Ajax是需要处理返回信息的，因此controller会将整个页面的源码作为string返回回去。\n3. 3、确保模板名字正确，以及模板内容无误。');
INSERT INTO `blog` VALUES ('0007', 'CSS基本操作', 'CSS，层叠样式表，配合HTML元素实现对页面的渲染。', '/pic/blogpic/d9f6086e013f4811b826ca24996e856e.jpg', '1', '10', 'miatum', '2020-10-02 14:16:29', '## 标签\n    @media (max/min-width/height){\n    css语句\n    }\n--根据判断视窗大小执行CSS。\n## 单位\nvw  相对于视口的宽度。视口被均分为100单位的vw(即浏览器可视区) 100vw = 可视区宽度\n\nvh  相对于视口的高度。视口被均分为100单位的vh(即浏览器可视区) 100vh  = 可视区高度\n\nvmin/vm 相对于视口的宽度或高度中较小的那个。其中最小的那个被均分为100单位的vmin（即vm）');
INSERT INTO `blog` VALUES ('0009', '王婷', '年年岁岁花相似，岁岁年年人不同。', '/pic/blogpic/f687e430bd344471b702cfaa3a65ae8b.jpg', '8', '15', 'miatum', '2020-10-04 04:27:54', '## 不知道怎么回事，这段低落期总是想起大学，想起初恋女友，可能这是我唯一拿得出手的回忆了\n按理来说，都分手了是应该表现得洒脱点，我搁这儿朝思暮想属实搞笑。不过反正没人知道，我不怕尴尬,我来细数一下我的神奇操作：\n-  WEB开发者模式从以前的空间留言可以看到她的QQ，一搜索发现头像是一张她近期的游客照，百度得知一浙江美术馆，看来生活过得还是很惬意的，不过穿着打扮已风格大变。而后觉得这些信息仍不足以满足我的好奇心，我便注册了个新的QQ号尝试加一下好友，没通过，罢了。\n- 一天我绞尽脑汁想起来我俩恋爱期间我有用过微博的，就安装微博上去一看，果然让我找到了一丝丝痕迹，从评论历史中可以看到她的账号，可是微博里一条关于她自己的内容都没有，只有头像疑似她本人被我保存了下来。\n\n哪怕我再怎么努力找寻她的踪迹，她始终是在过去的回忆里，我不该这样的，这样像一个偷窥狂，很病态。也许再过几年就好了。\n![](/pic/blogpic/c88cc47eacd047bab6c39c30c7bae198.jpg)\n\n\n\n###### 她的联系方式\n\n        QQ：1047552314\n        微博：幸得识卿桃花面从此 （阡陌多暖春，连起来好像是一句来自网络流传的标语）\n');
INSERT INTO `blog` VALUES ('0011', 'CSS样式来源以及优先级', 'CSS的来源可以影响作用在元素上的优先级，元素最后的呈现样式是结合所有来源的CSS样式并判定优先级后的一个层叠值。', '/pic/blogpic/0e226a4c280a4d60a9f69877c7a856d8.jpg', '1', '10', 'miatum', '2020-10-12 15:20:14', '#### 继承\n继承还是挺容易通过字面意思去理解的，即子元素会继承父元素的某些属性，常见的有font，如果给body定义了关于font的规则，此规则便会逐级被继承直到被覆盖。\n#### 层叠\n一个元素样式来源不是唯一的，如果冲突则根据优先级取交集，无冲突则取并集，而后依然有效的样式共同作用在元素上。\n#### 优先级\n###### 样式表的来源\n1、开发者写的样式表为**作者样式表**\n2、浏览器的默认样式或者浏览器允许用户可自定义样式，这些被称为用户代理样式\n优先级：作者样式>用户代理样式\n##### 行内样式\n行内样式没有选择器，直接作用于当前元素，我们可称之为最高优先级\n##### 选择器优先级\n一切遵循越精准越优先原则');
INSERT INTO `blog` VALUES ('0014', '博客优化', '主要记录博客的优化过程，并发现新的值得优化的地方。', '/pic/blogpic/1e2ce85f22d84176a6bfa88b84dc99a8.jpg', '1', '7', 'miatum', '2020-10-12 08:32:52', '# 管理界面\n1. ~~博客管理界面分类、标签显示的是ID~~   //blog实体类增加字段type_name，tag_name字段\n2. ~~博客管理界面双击进入编辑界面~~\n3. ~~类别、标签管理界面开启双击页面内编辑，舍弃点击编辑按钮弹窗编辑方式~~\n4. ~~table数据即时重载，新增或删除后不用刷新页面~~ 偶尔不会更新再次操作就行，原因不明\n5. 在没有选择时点击批量删除按钮后台会报SQL语法错误，建议前台先判断传值再让后台操作\n\n# 新增和编辑界面\n1. ~~阻止编辑和新增博客后页面的跳转~~\n2. ~~博客图片上传和保存问题~~\n3. 编辑和新增界面添加新增分类、标签的方法，最好优化成如果不存在改分类或标签自动新建\n4. 编辑和新增时日期、分类、标签不能为空\n5. 新增界面连续点击保存按钮，会增加多篇博客\n\n\n# 整体设计\n1. 博客标签只能选一个\n2. 进入后台管理没有身份验证\n3. 博客图片存储在项目静态资源路径下，开发和工作环境无法统一图片信息\n\n# 前台界面\n1. ~~展示界面~~\n2. ~~查看单篇界面~~\n3. 页面滑动速度控制，监听鼠标滚轮事件和上下方向键\n\n');
INSERT INTO `blog` VALUES ('0025', 'Java接收图片【转】', '当前端传参内容为图片时，Java后台的处理方法。', '/pic/blogpic/9538e345aaf94516ba332c80cf3d02d8.jpg', '1', '7', '小飞猪咯咯', '2020-10-13 22:16:31', '感谢这位博主。原文链接：[java接收图片的两种方法][1]\n太难了，感觉controller接收出问题了，保存的图片大小为0。\n果然采用第二种方法，会直接报空指针异常。\n终于用第二种方法成了，感觉这也是契合editor.md的，第一种方法估计只有理解了Java IO后才能去找出哪里出错了。\n```java\npublic String savePicByIo(HttpServletRequest request) throws IOException {\n        // 图片存储路径\n        String path = \"C:\\\\image\\\\factory\";\n        // 判断是否有路径\n        if (!new File(path).exists()) {\n            new File(path).mkdirs();\n        }\n        ServletInputStream inputStream = request.getInputStream();\n        String fileName = UUID.randomUUID().toString().replace(\"-\",\"\") + \".jpg\";\n        File tempFile = new File(path,fileName);\n        if (!tempFile.exists()) {\n            OutputStream os = new FileOutputStream(tempFile);\n            BufferedOutputStream bos = new BufferedOutputStream(os);\n            byte[] buf = new byte[1024];\n            int length;\n            length = inputStream.read(buf,0,buf.length);\n            while (length != -1) {\n                bos.write(buf, 0 , length);\n                length = inputStream.read(buf);\n            }\n            bos.close();\n            os.close();\n            inputStream.close();\n        }\n        return fileName;\n    }\n\n\n    public String savePicByFormData(MultipartFile file) throws IOException {\n\n        // 图片存储路径\n        String path = \"C:\\\\image\\\\factory\";\n        // 判断是否有路径\n        if (!new File(path).exists()) {\n            new File(path).mkdirs();\n        }\n        String fileName = UUID.randomUUID().toString().replace(\"-\",\"\") + \".jpg\";\n        File tempFile = new File(path,fileName);\n        if (!tempFile.exists()) {\n            tempFile.createNewFile();\n        }\n        file.transferTo(tempFile);\n        return fileName;\n    }\n```\n\n[1]: https://www.cnblogs.com/flypig666/p/12488556.html \"java接收图片的两种方法\"');
INSERT INTO `blog` VALUES ('0028', '当图片大于容器时保持原比例居中显示', 'css3中object-fit:cover的使用，可完全填充容器且显示图片居中的部分', '/pic/blogpic/61485d7071ed4bf2ad59ca8f997b7a41.jpg', '1', '10', 'miatum', '2020-10-16 16:05:51', '**object-fit**有5个值，分别是：\n- fill: 中文释义“填充”。默认值。替换内容拉伸填满整个content box, 不保证保持原有的比例。\n- contain: 中文释义“包含”。保持原有尺寸比例。保证替换内容尺寸一定可以在容器里面放得下。因此，此参数可能会在容器内留下空白。\n- cover: 中文释义“覆盖”。保持原有尺寸比例。保证替换内容尺寸一定大于容器尺寸，宽度和高度至少有一个和容器一致。因此，此参数可能会让替换内容（如图片）部分区域不可见。\n- none: 中文释义“无”。保持原有尺寸比例。同时保持替换内容原始尺寸大小。\n- scale-down: 中文释义“降低”。就好像依次设置了none或contain, 最终呈现的是尺寸比较小的那个。\n- 这里的容器指的的是应用.work-img样式的容器\n\n下面是演示cover的代码：\n```css\n.work-img img{\n    object-fit: cover;\n    width: 100%;\n    height: 100%;\n}\n```\nPS：通过background方式显示图片需要测试');
INSERT INTO `blog` VALUES ('0029', '父元素不可见，子元素可见', 'visibility属性的使用，而非常用的display。', '/pic/blogpic/e5f31b12da844acf92aa2dacdf5d6cd9.jpg', '1', '10', 'miatum', '2020-10-17 14:48:35', '###### display\n是不是一看见标题的问题就立马想到了用`display`来实现，像：\n```html\n<div style=\"display:none;\">\n	<div style=\"display:block\"></div>\n</div>\n```\n然而结果却并不会如你所愿，子元素`<div>`并不会显示，`display：none`是会被强制继承的。即使子元素`<div>`不写行内样式`display：block`，`<div>`标签的display的初始值就是block。\n此时就要理解`display: none`的实际效果了，设置了此效果的DOM元素是不会被浏览器渲染的，即不存在。\n###### visibility\n而要达到父元素可见，子元素不可见的效果，则需要用到`visibility`属性。\n```html\n<div style=\"visibility:hidden;\">\n	<div style=\"visibility:visible\"></div>\n</div>\n```\n设置`visibility: hidden`的元素是会被浏览器渲染的,只是针对用户不可见.');
INSERT INTO `blog` VALUES ('0030', 'Spring boot程序部署注意事项', 'Spring boot官方推荐用Jar包方式部署，因为其内置了tomcat的；如果需要用外置tomcat+war包形式部署，启动类需要继承SpringBootServletInitiailzer并重写其configure()方法。', '/pic/blogpic/82dc3e0fced94aa4a677a1713135cfa4.jpg', '1', '23', 'miatum', '2020-10-18 10:17:40', '### Jar包方式部署\n使用`maven`打包插件打包后，控制台切换到jar包目录，以`java -jar projectname.jar`运行。\n### war包方式部署\n在打包之前，确认启动类继承SpringBootServletInitiailzer并已重写其configure()方法。\n```java\n@SpringBootApplication\npublic class FileuploadApplication extends SpringBootServletInitializer {\n    public static void main(String[] args) {\n        SpringApplication.run(FileuploadApplication.class, args);\n    }\n    @Override\n    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {\n        return super.configure(builder);\n    }\n}\n```\n而后按照常规web项目放到tomcat/webapps下启动tomcat即可。');
INSERT INTO `blog` VALUES ('0031', '匈牙利算法', '计算最大匹配数', '', '1', '7', '', '2020-10-27 18:51:48', '###### 题目描述：\n若两个正整数的和为素数，则这两个正整数称之为“素数伴侣”，如2和5、6和13，它们能应用于通信加密。现在密码学会请你设计一个程序，从已有的N（N为偶数）个正整数中挑选出若干对组成“素数伴侣”，挑选方案多种多样，例如有4个正整数：2，5，6，13，如果将5和6分为一组中只能得到一组“素数伴侣”，而将2和5、6和13编组将得到两组“素数伴侣”，能组成“素数伴侣”最多的方案称为“最佳方案”，当然密码学会希望你寻找出“最佳方案”。\n输入:\n有一个正偶数N（N≤100），表示待挑选的自然数的个数。后面给出具体的数字，范围为[2,30000]。\n输出:\n输出一个整数K，表示你求得的“最佳方案”组成“素数伴侣”的对数。\n###### 解题思路：\n题目限定了输入数为[2,30000]，那么匹配成功后的素数一定是大于2的，大于2的素数有一个特性即都为奇数，奇数=偶数+奇数，于是输入数组可以拆分两个数组，一个奇数数组一个偶数数组，此时不难发现匈牙利算法适用。\n###### 匈牙利算法简介：\n###### 代码实现：');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', 'layui');
INSERT INTO `blog_tag` VALUES ('7', 'Java');
INSERT INTO `blog_tag` VALUES ('8', 'sql');
INSERT INTO `blog_tag` VALUES ('9', 'thymeleaf');
INSERT INTO `blog_tag` VALUES ('10', 'css');
INSERT INTO `blog_tag` VALUES ('11', 'JavaScript');
INSERT INTO `blog_tag` VALUES ('12', 'mybatis');
INSERT INTO `blog_tag` VALUES ('15', '恋爱');
INSERT INTO `blog_tag` VALUES ('16', 'editor.md');
INSERT INTO `blog_tag` VALUES ('17', 'HTML');
INSERT INTO `blog_tag` VALUES ('23', 'spring boot');

-- ----------------------------
-- Table structure for blog_type
-- ----------------------------
DROP TABLE IF EXISTS `blog_type`;
CREATE TABLE `blog_type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) NOT NULL,
  `type_name_en` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_type
-- ----------------------------
INSERT INTO `blog_type` VALUES ('1', '编程', 'Code');
INSERT INTO `blog_type` VALUES ('8', '秘密', 'Secrets');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0001', 'miatum', 'yyt0320');
