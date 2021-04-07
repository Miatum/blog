/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 10/03/2021 15:13:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_id` int(4) NULL DEFAULT NULL,
  `tag_id` int(4) NULL DEFAULT NULL,
  `author` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `type_id` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (0003, 'SVG基础用法', '在设计博客logo时想着一切从简，既然别人的样式我都能copy，logo为啥不行。不过毫不相干的logo用起来也确实勉强，就打算照猫画虎，于是SVG就绕不开了。', 'http://localhost:8082/58956a8263f647deab9951948c711c97.jpg', 1, 17, 'miatum', '2020-10-02 14:07:34', '# SVG 指可伸缩矢量图形 (Scalable Vector Graphics)\n在设计博客logo时想着一切从简，既然别人的样式我都能copy，logo为啥不行。不过毫不相干的logo用起来也确实勉强，就打算照猫画虎，于是SVG就绕不开了。\n');
INSERT INTO `blog` VALUES (0004, 'AJAX基础用法', '前后端交互的主要方式之一，Form表单方式只要了解相关的HTML组件属性即可使用；而AJAX则主要是Javascript的使用，很多框架也基于原生方法做了封装。', 'http://localhost:8082/d43ddf5db7d843bc9b019b88609f73ce.jpg', 1, 11, 'miatum', '2020-10-02 14:09:35', '# Ajax基础用法\n###### JavaScript写法\n    var xhr = new HttpRequest()\n    xhr.open(\'POST/GET\' , \'url\')\n    xhr.send(data)\n###### jQuery写法\n    $.ajax({\n    type : \"POST\",\n    url : \"/url\",\n    contentType : \"application/json\",\n    dataType : \"json\",\n    data : JSON.stringify(data),\n    success : function (result) {\n                    console.log(result);\n                },\n              error : function(e){\n                    console.log(e.status);\n                    console.log(e.responseText);\n              }\n    })\n###### axios写法\n```\naxios.post(\'url\', paras)\n  .then(response => {\n  })\n  .catch(error => {\n  })\n```\n\n###### 注意事项\n- 前端需要传空值时，不能赋值成null，交互都是以string进行的，null传到后端即\"null\"。如果该参数为某类的一个属性，传参时直接省略该参数即可，后端参数类型设为该类，此时该属性值会自动解析为空值；\neg: 新增用户，用户id不用传，由数据库自动递增，后端controller：\n```java\n@RequestMapping(\"/addUser\")\npublic String controller(User user){\n	return \"\";\n}\npublic class User{\n	int id;\n	String userName;\n	String password;\n}\n```\n前端form表单形式(省略id`<input>`标签)：\n```html\n<form>\n	<input name=\"userName\">\n	<input name=\"password\">\n</form>\n```\n前端Ajax形式发送JSON：\n```json\n[\"userName\":\"admin\",\"password\":\"123\"]\n```\n前端Ajax形式拼接请求头：\n```javascript\nxhr.open(\'POST\',\'/addUser?id&userName=admin&password=123\')\n//或者直接省略id\nxhr.open(\'POST\',\'/addUser?userName=admin&password=123\')\n```\n- 在传递Json对象时，记得调用JSON.Stringify()函数，将其转成字符串。\n');
INSERT INTO `blog` VALUES (0005, '范型', '本意是想让方法能够适用于更多类型参数，于是了解到范型。', 'http://localhost:8082/2d729e01a4e44242aeca892193507ae7.jpg', 1, 7, 'miatum', '2020-10-02 14:12:17', '在不确定参数具体类型时，可使用范型，达到方法可以接收任何类型的参数，如：\n```java\npublic class DataTransform {\n    public static <T> JSONObject forLayUiTable(List<T> list){\n        /**\n        *@Author: miatum\n        *@Description: 将list按layui数据表格要求格式转JSON,使用范型可以让该方法能同时接收Blog、Blog_Tag、Blog_Type、User\n        *@Date: 8:25 2020/9/28\n        */\n        JSONObject jsonObject=new JSONObject();\n        jsonObject.put(\"code\",0);\n        jsonObject.put(\"count\",list.size());\n        jsonObject.put(\"msg\",\"\");\n        jsonObject.put(\"data\",list);\n        return jsonObject;\n    }\n}\n```');
INSERT INTO `blog` VALUES (0006, 'Thyme leaf基础用法', 'Thyme leaf是spring boot推荐的模板引擎，其内联表达式可以运用在页面内DOM元素属性、CSS、Javascript里。', 'http://localhost:8082/ac35dac3d46c4eeeb73102657060cdde.jpg', 1, 9, 'miatum', '2020-10-02 14:13:01', '# Thymeleaf基础用法\n一个模板引擎罢了，真不熟。\n依赖：\n```xml\n    <dependency>\n    	<groupId>org.springframework.boot</groupId>\n    	<artifactId>spring-boot-starter-thymeleaf</artifactId>\n    </dependency>\n```\n## 问题集锦\n- 在模板中使用layui数据表格时，会出现[[]]连写的情况，但[[]]在thyme leaf中为内联表达式，解决方法:\n[\n[\n]\n]\n就硬换行分开写就行。\n- controller无法跳转页面。犯病情况有很多种：\n1. 1、用了@RestController或者@ResponseBody，这样只能返回字符串。\n2. 2、用Ajax请求，因为用于页面跳转的情况一般只是为了页面初始化带有数据，而Ajax则是数据交互时使用，Ajax是需要处理返回信息的，因此controller会将整个页面的源码作为string返回回去。\n3. 3、确保模板名字正确，以及模板内容无误。');
INSERT INTO `blog` VALUES (0007, 'CSS基础知识', 'CSS，层叠样式表，配合HTML元素实现对页面的渲染。', 'http://localhost:8082/d9f6086e013f4811b826ca24996e856e.jpg', 1, 10, 'miatum', '2020-10-02 14:16:29', '## 标签\n    @media (max/min-width/height){\n    css语句\n    }\n--根据判断视窗大小执行CSS。\n## 单位\nvw  相对于视口的宽度。视口被均分为100单位的vw(即浏览器可视区) 100vw = 可视区宽度\n\nvh  相对于视口的高度。视口被均分为100单位的vh(即浏览器可视区) 100vh  = 可视区高度\n\nvmin/vm 相对于视口的宽度或高度中较小的那个。其中最小的那个被均分为100单位的vmin（即vm）');
INSERT INTO `blog` VALUES (0009, '王婷', '年年岁岁花相似，岁岁年年人不同。', 'http://localhost:8082/f687e430bd344471b702cfaa3a65ae8b.jpg', 8, 15, 'miatum', '2020-10-04 04:27:54', '## 不知道怎么回事，这段低落期总是想起大学，想起初恋女友，可能这是我唯一拿得出手的回忆了\n按理来说，都分手了是应该表现得洒脱点，我搁这儿朝思暮想属实搞笑。不过反正没人知道，我不怕尴尬,我来细数一下我的神奇操作：\n-  WEB开发者模式从以前的空间留言可以看到她的QQ，一搜索发现头像是一张她近期的游客照，百度得知一浙江美术馆，看来生活过得还是很惬意的，不过穿着打扮已风格大变。而后觉得这些信息仍不足以满足我的好奇心，我便注册了个新的QQ号尝试加一下好友，没通过，罢了。\n- 一天我绞尽脑汁想起来我俩恋爱期间我有用过微博的，就安装微博上去一看，果然让我找到了一丝丝痕迹，从评论历史中可以看到她的账号，可是微博里一条关于她自己的内容都没有，只有头像疑似她本人被我保存了下来。\n\n哪怕我再怎么努力找寻她的踪迹，她始终是在过去的回忆里，我不该这样的，这样像一个偷窥狂，很病态。也许再过几年就好了。\n![](/pic/blogpic/c88cc47eacd047bab6c39c30c7bae198.jpg)\n\n\n\n###### 她的联系方式\n\n        QQ：1047552314\n        微博：幸得识卿桃花面从此 （阡陌多暖春，连起来好像是一句来自网络流传的标语）\n');
INSERT INTO `blog` VALUES (0011, 'CSS样式来源以及优先级', 'CSS的来源可以影响作用在元素上的优先级，元素最后的呈现样式是结合所有来源的CSS样式并判定优先级后的一个层叠值。', 'http://localhost:8082/0e226a4c280a4d60a9f69877c7a856d8.jpg', 1, 10, 'miatum', '2020-10-12 15:20:14', '#### 继承\n继承还是挺容易通过字面意思去理解的，即子元素会继承父元素的某些属性，常见的有font，如果给body定义了关于font的规则，此规则便会逐级被继承直到被覆盖。\n#### 层叠\n一个元素样式来源不是唯一的，如果冲突则根据优先级取交集，无冲突则取并集，而后依然有效的样式共同作用在元素上。\n#### 优先级\n###### 样式表的来源\n1、开发者写的样式表为**作者样式表**\n2、浏览器的默认样式或者浏览器允许用户可自定义样式，这些被称为用户代理样式\n优先级：作者样式>用户代理样式\n##### 行内样式\n行内样式没有选择器，直接作用于当前元素，我们可称之为最高优先级\n##### 选择器优先级\n一切遵循越精准越优先原则');
INSERT INTO `blog` VALUES (0014, '博客优化', '主要记录博客的优化过程，并发现新的值得优化的地方。', 'http://localhost:8082/1e2ce85f22d84176a6bfa88b84dc99a8.jpg', 1, 7, 'miatum', '2020-10-12 08:32:52', '# 管理界面\n1. ~~博客管理界面分类、标签显示的是ID~~   //blog实体类增加字段type_name，tag_name字段\n2. ~~博客管理界面双击进入编辑界面~~\n3. ~~类别、标签管理界面开启双击页面内编辑，舍弃点击编辑按钮弹窗编辑方式~~\n4. ~~table数据即时重载，新增或删除后不用刷新页面~~ 偶尔不会更新再次操作就行，原因不明\n5. 在没有选择时点击批量删除按钮后台会报SQL语法错误，建议前台先判断传值再让后台操作\n\n# 新增和编辑界面\n1. ~~阻止编辑和新增博客后页面的跳转~~\n2. ~~博客图片上传和保存问题~~\n3. 编辑和新增界面添加新增分类、标签的方法，最好优化成如果不存在改分类或标签自动新建\n4. 编辑和新增时日期、分类、标签不能为空\n5. 新增界面连续点击保存按钮，会增加多篇博客\n\n\n# 整体设计\n1. 博客标签只能选一个\n2. 进入后台管理没有身份验证\n3. 博客图片存储在项目静态资源路径下，开发和工作环境无法统一图片信息\n\n# 前台界面\n1. ~~展示界面~~\n2. ~~查看单篇界面~~\n3. 页面滑动速度控制，监听鼠标滚轮事件和上下方向键\n4. PWA技术\n\n');
INSERT INTO `blog` VALUES (0025, 'Java接收图片的方法', '当前端传参内容为图片时，Java后台的处理方法。', 'http://localhost:8082/9538e345aaf94516ba332c80cf3d02d8.jpg', 1, 7, '小飞猪咯咯', '2020-10-13 22:16:31', '感谢这位博主。原文链接：[java接收图片的两种方法][1]\n太难了，感觉controller接收出问题了，保存的图片大小为0。\n果然采用第二种方法，会直接报空指针异常。\n终于用第二种方法成了，感觉这也是契合editor.md的，第一种方法估计只有理解了Java IO后才能去找出哪里出错了。\n```java\npublic String savePicByIo(HttpServletRequest request) throws IOException {\n        // 图片存储路径\n        String path = \"C:\\\\image\\\\factory\";\n        // 判断是否有路径\n        if (!new File(path).exists()) {\n            new File(path).mkdirs();\n        }\n        ServletInputStream inputStream = request.getInputStream();\n        String fileName = UUID.randomUUID().toString().replace(\"-\",\"\") + \".jpg\";\n        File tempFile = new File(path,fileName);\n        if (!tempFile.exists()) {\n            OutputStream os = new FileOutputStream(tempFile);\n            BufferedOutputStream bos = new BufferedOutputStream(os);\n            byte[] buf = new byte[1024];\n            int length;\n            length = inputStream.read(buf,0,buf.length);\n            while (length != -1) {\n                bos.write(buf, 0 , length);\n                length = inputStream.read(buf);\n            }\n            bos.close();\n            os.close();\n            inputStream.close();\n        }\n        return fileName;\n    }\n\n\n    public String savePicByFormData(MultipartFile file) throws IOException {\n\n        // 图片存储路径\n        String path = \"C:\\\\image\\\\factory\";\n        // 判断是否有路径\n        if (!new File(path).exists()) {\n            new File(path).mkdirs();\n        }\n        String fileName = UUID.randomUUID().toString().replace(\"-\",\"\") + \".jpg\";\n        File tempFile = new File(path,fileName);\n        if (!tempFile.exists()) {\n            tempFile.createNewFile();\n        }\n        file.transferTo(tempFile);\n        return fileName;\n    }\n```\n\n[1]: https://www.cnblogs.com/flypig666/p/12488556.html \"java接收图片的两种方法\"');
INSERT INTO `blog` VALUES (0028, '当图片大于容器时保持原比例居中显示', 'css3中object-fit:cover的使用，可完全填充容器且显示图片居中的部分', 'http://localhost:8082/61485d7071ed4bf2ad59ca8f997b7a41.jpg', 1, 10, 'miatum', '2020-10-16 16:05:51', '**object-fit**有5个值，分别是：\n- fill: 中文释义“填充”。默认值。替换内容拉伸填满整个content box, 不保证保持原有的比例。\n- contain: 中文释义“包含”。保持原有尺寸比例。保证替换内容尺寸一定可以在容器里面放得下。因此，此参数可能会在容器内留下空白。\n- cover: 中文释义“覆盖”。保持原有尺寸比例。保证替换内容尺寸一定大于容器尺寸，宽度和高度至少有一个和容器一致。因此，此参数可能会让替换内容（如图片）部分区域不可见。\n- none: 中文释义“无”。保持原有尺寸比例。同时保持替换内容原始尺寸大小。\n- scale-down: 中文释义“降低”。就好像依次设置了none或contain, 最终呈现的是尺寸比较小的那个。\n- 这里的容器指的的是应用.work-img样式的容器\n\n下面是演示cover的代码：\n```css\n.work-img img{\n    object-fit: cover;\n    width: 100%;\n    height: 100%;\n}\n```\nPS：通过background方式显示图片需要测试');
INSERT INTO `blog` VALUES (0029, '父元素不可见，子元素可见', 'visibility属性的使用，而非常用的display。', 'http://localhost:8082/e5f31b12da844acf92aa2dacdf5d6cd9.jpg', 1, 10, 'miatum', '2020-10-17 14:48:35', '###### display\n是不是一看见标题的问题就立马想到了用`display`来实现，像：\n```html\n<div style=\"display:none;\">\n	<div style=\"display:block\"></div>\n</div>\n```\n然而结果却并不会如你所愿，子元素`<div>`并不会显示，`display：none`是会被强制继承的。即使子元素`<div>`不写行内样式`display：block`，`<div>`标签的display的初始值就是block。\n此时就要理解`display: none`的实际效果了，设置了此效果的DOM元素是不会被浏览器渲染的，即不存在。\n###### visibility\n而要达到父元素可见，子元素不可见的效果，则需要用到`visibility`属性。\n```html\n<div style=\"visibility:hidden;\">\n	<div style=\"visibility:visible\"></div>\n</div>\n```\n设置`visibility: hidden`的元素是会被浏览器渲染的,只是针对用户不可见.');
INSERT INTO `blog` VALUES (0030, 'Spring boot程序部署注意事项', 'Spring boot官方推荐用Jar包方式部署，因为其内置了tomcat的；如果需要用外置tomcat+war包形式部署，启动类需要继承SpringBootServletInitiailzer并重写其configure()方法。', 'http://localhost:8082/82dc3e0fced94aa4a677a1713135cfa4.jpg', 1, 23, 'miatum', '2020-10-18 10:17:40', '### Jar包方式部署\n使用`maven`打包插件打包后，控制台切换到jar包目录，以`java -jar projectname.jar`运行。\n### war包方式部署\n在打包之前，确认启动类继承SpringBootServletInitiailzer并已重写其configure()方法。\n```java\n@SpringBootApplication\npublic class FileuploadApplication extends SpringBootServletInitializer {\n    public static void main(String[] args) {\n        SpringApplication.run(FileuploadApplication.class, args);\n    }\n    @Override\n    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {\n        return super.configure(builder);\n    }\n}\n```\n而后按照常规web项目放到tomcat/webapps下启动tomcat即可。');
INSERT INTO `blog` VALUES (0031, '匈牙利算法', '计算最大匹配数', 'http://localhost:8082/a8ea78be01ff4145be3b8a971d85034a.jpg', 1, 7, 'miatum', '2020-10-27 18:51:48', '###### 题目描述：\n若两个正整数的和为素数，则这两个正整数称之为“素数伴侣”，如2和5、6和13，它们能应用于通信加密。现在密码学会请你设计一个程序，从已有的N（N为偶数）个正整数中挑选出若干对组成“素数伴侣”，挑选方案多种多样，例如有4个正整数：2，5，6，13，如果将5和6分为一组中只能得到一组“素数伴侣”，而将2和5、6和13编组将得到两组“素数伴侣”，能组成“素数伴侣”最多的方案称为“最佳方案”，当然密码学会希望你寻找出“最佳方案”。\n输入:\n有一个正偶数N（N≤100），表示待挑选的自然数的个数。后面给出具体的数字，范围为[2,30000]。\n输出:\n输出一个整数K，表示你求得的“最佳方案”组成“素数伴侣”的对数。\n###### 解题思路：\n题目限定了输入数为[2,30000]，那么匹配成功后的素数一定是大于2的，大于2的素数有一个特性即都为奇数，奇数=偶数+奇数，于是输入数组可以拆分两个数组，一个奇数数组一个偶数数组，此时不难发现匈牙利算法适用。\n###### 匈牙利算法简介：\n###### 代码实现：\n');
INSERT INTO `blog` VALUES (0050, '候鸟', '四季变换，候鸟南飞', 'http://localhost:8082/ec6ab929a2c241c298a27f008674579c.jpg', 37, 25, '五月天', '2021-02-23 05:22:53', '::: hljs-center\n\n###### 冰箱上有字条\n###### 桌上有菜\n###### 电锅里面有饭\n###### 没有人在\n###### 电话里的独白\n###### 还在等待\n###### 一个人的表情\n###### 怎么安排\n###### 我也早有预感\n###### 一起风满\n###### 生命的窗忘了关\n###### 吹进意外\n###### 旅途上的愉快\n###### 划过一半\n###### 南方又在呼唤\n###### 当我醒来\n###### 飞过那片茫茫人海\n###### 下个路口直走或转弯\n###### 长大太慢老得太快\n###### 等得太久\n###### 结果太难猜\n###### 我的故事被风吹散\n###### 我的明天我从不期待\n###### 所以现在我只想要\n###### 寻找一丝最后的温暖\n###### 包厢里的狂欢\n###### 曲终人散\n###### 长夜里的空白\n###### 消化不完\n###### 灵魂总是要贪\n###### 片刻灿烂\n###### 那双唇的孤单\n###### 变得野蛮\n###### 那陌生的阳光\n###### 照在床单\n###### 昨夜发生的事\n###### 不想再猜\n###### 而枕边的人啊\n###### 一直在换\n###### 每一次都以为\n###### 到了终站\n###### 飞过那片茫茫人海\n###### 下个路口直走或转弯\n###### 长大太慢老得太快\n###### 等得太久\n###### 结果太难猜\n###### 我的故事被风吹散\n###### 我的明天我从不期待\n###### 所以现在我只想要\n###### 寻找一丝最后的温暖\n\n\n:::\n');
INSERT INTO `blog` VALUES (0051, '发掘 The Dig', '纪实故事', 'http://localhost:8082/8b649c3b745a44069afc3a4d28b2bafb.jpg', 35, 26, '西蒙·斯通', '2021-01-28 16:00:00', '##### 由难到易\n人是复杂的生命体，除了身体机能还有情感，生活中种种的挑战诸多的不如意带来的消极情绪很难有释放的机会。古人聪明，知道防微杜渐，从源头根除，所谓求其上而得其中，如果事先经历了更大的挫折更困难的挑战，那么往后将面对的都不会是问题。\n道理衍变到现在，变成了若是厌倦了琐碎生活就想想战争时期平民的苦难，就会珍惜当下得来不易的和平生活。那么，问题来了，战争时期的人们是怎么靠这种理念撑过来的呢？比战争更可怖的是什么呢？比战争时期的生活更苦难的生活是什么样的呢？想且想不出，先辈们有怎么会经历过呢。\n##### 更高的境界\n');
INSERT INTO `blog` VALUES (0052, '波斯语课 Persischstunden', '二战时时期的犹太人，通过教授德国军官波斯语而获得逃生机会。', 'http://localhost:8082/a1cd38101a624b58be97737e1f400c98.jpg', 35, 1, '瓦迪姆·佩尔曼', '2020-09-23 16:00:00', '##### 对立面\n小时候看电影，总要对电影里的角色分阵营，非好即坏，喜好厌坏。现在长大了，心思变复杂了，看问题反而没那么透彻了。不过看完《波斯语课》，想着按小时候的方式再来划分一次角色的阵营。\n\n###### 角色列表\n- 主人公雷扎：\n- 以书换面包的犹太人\n- 上尉：\n- 指挥官\n- 女下士1\n- 女下士2\n- 男下士1\n- 男下士2\n');
INSERT INTO `blog` VALUES (0053, '跨域问题', '前后端分离情况下，前端请求后端接口存在跨域问题', '', 1, 11, 'miatum', '2021-02-23 15:27:39', '###### 什么是跨域：\n跨源资源共享 (CORS) （或通俗地译为跨域资源共享）是一种基于HTTP 头的机制，该机制通过允许服务器标示除了它自己以外的其它origin（域，协议和端口），这样浏览器可以访问加载这些资源。跨源资源共享还通过一种机制来检查服务器是否会允许要发送的真实请求，该机制通过浏览器发起一个到服务器托管的跨源资源的\"预检\"请求。在预检中，浏览器发送的头中标示有HTTP方法和真实请求中会用到的头。\n\n跨源HTTP请求的一个例子：运行在 http://domain-a.com 的JavaScript代码使用XMLHttpRequest来发起一个到 https://domain-b.com/data.json 的请求。\n\n出于安全性，浏览器限制脚本内发起的跨源HTTP请求。 例如，XMLHttpRequest和Fetch API遵循同源策略。 这意味着使用这些API的Web应用程序只能从加载应用程序的同一个域请求HTTP资源，除非响应报文包含了正确CORS响应头。\n\n###### 哪些情况会导致跨域：\n- IP不同\n- 端口不同\n- IP相同端口不同\n- IP不同端口相同\n###### 跨域问题的解决办法：\n以nginx部署vue项目为例，如果开发环境时的proxy配置导致axios写法如下：\n```\naxios.get(\'api/selectAllBlog\').then(response => {\n    }).catch(error => {\n      console.log(error)\n    })\n\n```\n那么在打包后部署时需要在nginx.conf加入以下内容：\n```\n// \'/api/\'，\'http://127.0.0.1:8081/\'根据实际情况填写\nlocation /api/ {\n    proxy_pass   http://127.0.0.1:8081/;\n}\n\n```\n\n\n');
INSERT INTO `blog` VALUES (0054, '九寨沟之旅', '2021年3月,为期一个月的九寨沟出差之旅', '', 8, 33, 'Miatum ', '2021-03-02 12:19:20', '### 感受\n  虽然目前无法避免工作出差,但是去到一些地方,看到不同的风景人情,不失为丰富人生的见识.想走得远,很难;想看得多,亦很难.尤其人们总是对生活怀抱着美好的期望,现实难免会有落差,怎么说服自己去接受去苦中作乐呢?\n### 途中见闻\n  早早出发,赶了1小时的地铁,和同事会和出发,已是早上9点.车内我们三人,有一搭没一搭的聊着我们8090的童年,抓螃蟹钓鱼,无一不美好,车窗外的阳光一直照耀着我们,指引着我们一路向北.慢慢,成都平原被我们甩在身后,傍着我们的是连绵不绝的山峰,不高却显得那么威严;道路旁的岷江是我们的路标,我们像是去追逐它的源头而非奔着某个明确的目的地.\n  今年的春天来得贴别早,原以为是上天为抚恤经过一年疫情折磨的人们,迫不及待的想温暖可怜的世众,不过那远方雪白的山头打消了我的臆想.原来,春暖花开有时,高岭积雪亦有时.我小憩了一会,醒来是下午2点左右,我们在路边的一个饭店停下,打开车门,贯穿整个山谷的风肆无忌惮地吹拂着我,带着冷冽.我们透过饭馆店璃墙面,向里打探着,老板娘看见我们便热情的招呼我们进去.饭店内还存留着过年的气息,有几人围坐打着麻将,另一边烧着炉火,煮着可乐红枣枸杞,炉边拜访着糖果干粮,我感觉到暖和,我们像是来串门的.\n');
INSERT INTO `blog` VALUES (0055, '华为服务器H22H-05', '服务器系统安装，网络配置', '', 43, 30, 'miatum', '2021-03-08 12:00:55', '### 方式\n以下方式按优先级排序\n1、服务器iBMC网口直连PC,PC配置IP为192.168.2.x(0=<x && x <= 255, x != 100),浏览器访问192.168.2.100，默认用户名Admin，密码Admin@9000。\n**步骤**\n一、配置磁盘阵列（device manager -> ）\n如果有且只有一块SDD，即明显的系统预留盘，则将此硬盘作为RAID 0模式建立磁盘阵列。\n其余硬盘中相同大小的机械硬盘，则建议视硬盘数量选择RAID 1（2块），RAID 5（大于2块）。\n二、挂载镜像\n通过web端远程管理界面挂载镜像文件，在boot manager中选择virtual DVD-ROOM，开始安装。\n2、启动盘，将镜像通过Ultra ISO刻录到Ｕ盘中，以此进行系统安装。\n**步骤**\n一、同１进行磁盘阵列配置。\n二、进入bootmanager，设置从U盘启动，重启进行系统安装程序。\n\n');
INSERT INTO `blog` VALUES (0056, 'Oracle数据库的备份与还原', 'expdp, impdp命令的使用', '', 1, 32, 'miatum', '2021-03-08 12:22:14', '### Oracle用户\nOracle的存储结构为:全局数据库 -> 用户 -> 表,即单实例Oracle数据库中只有一个数据库,表都是和用户绑定的,这点概念和MySQL,SQL server不同\n### 备份\n1 建立逻辑导出路径,建立物理路径,并授权给用户(SQL plus)\n连接数据库\n```\ncreate directory dumpdir as \'C:\\backfolder\';\n\n```\n\n在C盘下建立backfolder文件夹\n```\ngrant read, write on directory dumpdir to username;\n```\n\n2 执行导出语句(cmd / terminal)\n```\nexpdp username/password@ip/sid schemas=username directory=dumpdir dumpfile=expdp.dmp logfile=expdp.log\n\n```\n上面语句,即导出位于ip的实例名为sid的用户username下所有表到C:\\backfolder下的expdp.dmp文件中,导出日志文件为expdp.log\n### 还原\n1 建立表空间(SQL plus)\n```\ncreate tablespace impdpspace datafile \'C:\\backfolder\\expdp.dmp\' size 1024M autoextend on next 200M maxsize unlimited logging extent management local segment space management auto;\n\n```\n\n2 建立用户,指定用户表空间并授权(SQL plus)\n```\n// 建立用户,指定表空间\ncreate user username identified by password default tablespace=impdpspace;\n// 用户授权\ngrant create view, alter session, connect, resource, unlimited tablespace to username;\ngrant imp_full_database to username;\n\n```\n3 创建恢复路径并授权(SQL plus)\n```\ncreate or replace directory dumpdir as \'C:\\backfolder\';\ngrant read, write on directory to username;\n\n```\n4 执行导入语句\n```\nimpdp username/password directory=dumpdir dumpfile=expdp.dmp;\n\n```\n');
INSERT INTO `blog` VALUES (0057, '送你一朵小红花', '两个抗癌家庭，两组生活轨迹。影片讲述了一个温情的现实故事，思考和直面了每一个普通人都会面临的终极问题——想象死亡随时可能到来，我们唯一要做的就是爱和珍惜。', 'http://localhost:8082/46e060f0a8284e8392b2221661b5e523.jpg', 35, 33, '韩延', '2021-03-08 13:22:38', '');
INSERT INTO `blog` VALUES (0058, '同学麦娜丝', '', 'http://localhost:8082/f7d6c07db24b4cb19e8577a370a7aab1.jpg', 35, 33, '黄信尧', '2021-03-09 08:36:33', '');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'layui');
INSERT INTO `tag` VALUES (7, 'Java');
INSERT INTO `tag` VALUES (8, 'sql');
INSERT INTO `tag` VALUES (9, 'thymeleaf');
INSERT INTO `tag` VALUES (10, 'css');
INSERT INTO `tag` VALUES (11, 'JavaScript');
INSERT INTO `tag` VALUES (12, 'mybatis');
INSERT INTO `tag` VALUES (15, '恋爱');
INSERT INTO `tag` VALUES (16, 'editor.md');
INSERT INTO `tag` VALUES (17, 'HTML');
INSERT INTO `tag` VALUES (23, 'spring boot');
INSERT INTO `tag` VALUES (25, '老歌');
INSERT INTO `tag` VALUES (26, '战争');
INSERT INTO `tag` VALUES (27, 'nginx');
INSERT INTO `tag` VALUES (28, 'VUE');
INSERT INTO `tag` VALUES (29, 'mavonEditor');
INSERT INTO `tag` VALUES (30, '服务器');
INSERT INTO `tag` VALUES (31, 'Linux');
INSERT INTO `tag` VALUES (32, 'Oracle');
INSERT INTO `tag` VALUES (33, '旅游');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type_name_en` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '编程', 'Code');
INSERT INTO `type` VALUES (8, '记事', ' Diary');
INSERT INTO `type` VALUES (35, '影视', 'Video');
INSERT INTO `type` VALUES (37, '音乐', 'Music');
INSERT INTO `type` VALUES (41, '手工', 'Manual');
INSERT INTO `type` VALUES (42, '街舞', 'Breaking');
INSERT INTO `type` VALUES (43, '硬件', 'Hardware');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (0001, 'miatum', 'yyt0320');

SET FOREIGN_KEY_CHECKS = 1;
