## 背景与目标

当为你的团队招聘程序员时，你经常会面试到那些挣扎于基本代码中的人。这里有一篇非常著名的文章谈论
[Why Can't Programmers... Program?](http://blog.codinghorror.com/why-cant-programmers-program/)，其中提到了"FizzBuzz"问题。

让我们来完成这个基本程序问题，并确保我们可以做到它 😊

## 详细说明

编写一个 `fizz_buzz`方法，它以一个`number` 作为参数，并返回一个`number`大小的数组，该数组以从1到`number` 的数字组成，但需要根据这些规则替换其中的一些元素：

- 如果数字可以被`3`除，将它替换成`'Fizz'`
- 如果数字可以被`5`除，将它替换成`'Buzz'`
- 如果数字可以被`3`和`5`除，将它替换成`'FizzBuzz'`

例如

```ruby
fizz_buzz(7)
# => [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7]
```
