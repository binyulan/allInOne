一 number

1.1 数字直接量

/**
 * 数字直接量
 */
var num1 = 10; //定义一个数字变量，值是10
var num2 = 10.5 //值是10.5
var num3 = Infinity; //值是无穷大，Infinity是一个全局变量
var num4 = 10 / 0; //值是无穷大 Infinity
var num5 = 10 / -0; //值是负无穷大 -Infinity
var num6 = 0 / 0; //值是NaN，表示不是一个数字，NaN是一个全局变量
var num7 = 2E2; //值是200，2 * 10^2
var num8 = 2E-2; //值是0.02，2 * 10^-2

1.2 数字运算

/**
 * 数字运算
 */
var num9 = 1 + 2; //加法，值为3
var num10 = 1 - 2; //减法，值为-1
var num11 = 1 * 2; //乘法，值为2
var num12 = 1 / 2; //除法，值为0.5
var num13 = 1 % 2; //取余，值为0

1.3 扩展阅读

/**
 * 扩展阅读
 */
var val1 = (NaN == NaN); //返回false, 因为NaN不和任何值相等
var val2 = isNaN(0 / 0); //返回true, 全局函数isNaN可以判断值是否为NaN
var val3 = NaN;
var val4 = (val3 != val3) //返回true, 只有NaN才自己不等于自己。可以通过此特性判断val3是否是NaN
var val5 = isFinite(1 / 0); //返回true,全局函数isFinite可以判断是否是正无穷大或者负无穷大
var val6 = isFinite(1 / -0); //返回true,全局函数isFinite可以判断是否是正无穷大或者负无穷大

二 string

2.1 字符串直接量

/**
 * 字符串直接量，可以使用单引号，也可以使用双引号
 */
var str1 = "a string"; //定义一个字符串变量str1，值是 a string
var str2 = "it's correct"; //双引号包裹，字符串可以使用单引号
var str3 = 'it\'s correct'; //单引号包裹，必须使用右斜线\转移

2.2 转义字符

使用右斜线加一个字符来转义字符
var str4 = "line1\nline2"; //换行符\n
var str8 = "\\"; //右斜线本身\
var str6 = "it\'s correct"; //单引号\'
var str7 = "it\"s correct"; //双引号\"
var str8 = "\x41"; // \x后面跟两位16进制数，ascii码表里面可以查到这个是大写字母A
var str9 = "\u03c0"; // \x后面跟四位16进制数，Unicode码表里面可以查到这个是圆周率字符π

三 boolean

3.1 boolean 值只有两个值, true 和 false.

3.2 下列值转为boolean时为false

undefined
null
0
-0
NaN
""

四 undefined

4.1 undefined 表示变量没有初始化

typeof undefined // 返回undefined，说明undefined是一种类型
var var1;
console.info(var1); // 返回undefined
function fun1(p1){console.info(p1)};
fun1(); //输出undefined，不传参数，则参数为undefined
console.info(window.hasOwnProperty("undefined")); //返回ture，说明undefined是一个全局变量，它的值是undefined

五 object

5.1 定义对象

var obj1 = {name : "tom", age : "90"};
typeof obj1; // 返回值 object
console.info(obj1.name); //返回值 tom 

5.2 null 表示指向一个空的对象

var obj2 = null;
typeof obj; // 返回object

5.3 数组也是对象

var obj4 = [1, 2, 3, 4];
typeof obj4; //返回object

5.4 函数也是一种特殊的对象

var obj3 = function(p1, p2){};
typeof obj3; //返回 function，但是函数其实也是对象类型
console.info(obj3.length); //返回 2，length属性表示的是函数参数的个数


