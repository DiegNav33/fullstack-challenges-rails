## 背景与目标

现在你已经熟悉了迁移和模型，是时候来一个真实的场景了。
如果你没有任何**数据**，你如何测试你的数据库是否工作？
要做到这一点，我们需要创建一堆数据，我们可以用这些数据来引导我们的数据库。这被称为`seed`。

##设置

我们将使用[faker](https://github.com/stympy/faker) gem来生成`Post`属性。
但首先你必须安装它：

```bash
gem install faker
```

这里有一个很有用的命令，可以`放下(drop)`你的数据库，`重新创建(recreate)`它，`迁移(migrate)`模式和`seed`它。
在建立seed的过程中，它可以为你节省很多时间，而且在项目周中你会经常用到它，所以要习惯它!

```bash
rake db:drop db:create db:migrate db:seed
```

一旦你完成了seed，你就可以用基本的SQL查询来查看你刚才用`rake db:seed`插入的行。

```bash
sqlite3 db/development.sqlite3
sqlite> .mode columns
sqlite> .headers on
sqlite> SELECT * FROM posts;
```

## 详细说明

打开`db/seeds.rb`文件，编写一些代码来插入100个帖子，使用由[`faker`](https://github.com/stympy/faker) 这个gem生成的假数据。
那里有很多有趣的伪造选项，所以发挥你的创造性 😊。
请看一下它们在[这里](https://github.com/stympy/faker#faker)!
