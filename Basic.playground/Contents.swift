
//常數、變數、浮點數、整數
let name = "Joe"
var price = 30
var number = -16.22  //自動判斷為浮點數
var pp: Int = 8  //指定為整數
print(number+Double(pp))
print(Int(number)+pp) //相加時要讓型別相同

//元組(可分解 or 給名稱:值)
var kk = ("呂汝", 158.5, 100)
var (word, high, score) = kk
let cc = (me:"波", high:158.5, score:90)
print("My name is \(word), 身高\(high)!!")
print("我的綽號：\(cc.me), 身高\(cc.high)!!")

//可選型別：在宣告時後面加上?才可設為nil
var someScore: Int?
someScore = 100
someScore = nil
var some: Int! = 400  //強制解析：可選型別一定有值

//運算子
let (x,y) = (1,2)  //指派運算子：元組
var a = 25  //三元運算子
if a < 60 {
    a = a + 50
} else {
    a = a + 20  //可寫成這樣：a = a + (a < 60 ? 50 : 20)
}

let b = "red"
var c: String? // 未指派值 所以預設為 nil
var answer = c ?? b    // 未指派值給 c ,所以會返回 b
print(answer)  //a != nil ? a! : b（這個寫法的簡寫

//區間運算子
for index in 1...5{  //閉區間運算子...包含1~5
    print(index)
}
for index2 in 1..<5{  //半開區間運算子..<包含1~4
    print(index2)
}

//邏輯運算子
let mama = false
let baba = true

print("mama \(!mama)") //邏輯非: !

if mama && baba{  //邏輯且: &&
    print("mama baba are the same")
}
else{
    print("mama baba are different")
}

if mama || baba{  //邏輯或: ||
    print("mama baba are the same or different.")
}
else{
    print("no way")
}

var Me : String = ""
for _ in 1...2 {   //可用＿替代
    Me += "LU"
    print(Me)
}
//.count 計算字元數量、.characters 一個個印出字元、 .hasPrefix 前綴相同、.hasSuffix 後綴相同
print(Me.count)
print("\(Me + " is my name!!")")  //字串插值可用於表達式

let blackHeart = "\u{2665}"  //括號裡的數字為任意一到八位十六進制數且可用的 Unicode 位碼
print(blackHeart)

//Array 陣列：有順序，只能儲存同一型別
var arr = [Int]()  //空陣列，也可以這樣寫：var arr: Array<Int>()

//也可以這樣宣告空陣列
arr.append(198) //產生一個值
arr = []  //變回空陣列
var three0 = [Int](repeating: 0, count: 3)
var three1 = [Int](repeating: 1, count: 3)
print("\(three0 + three1)") //合併兩陣列
var arr3 = ["haha", "hehe", "hoho"] //也等於：var arr3 : [String] = ["haha", "hehe", "hoho"]
arr3[0...2] = ["me", "mo", "ma"] //更改陣列值（順序為0,1,2...類推）
arr3.insert("meow", at: 0) //在特定位置插入值
arr3.remove(at: 3) //移除位置在3的值
for (index, value) in arr3.enumerated() {  //.enumerated()方法可列示順序及值
    print("sequense \(index): \(value)")
}

//Sets 集合： 相同型別、沒有順序性、不能重複值
var hello : Set<Int>
var helloo = Set<Int>()
var sett : Set<String> = ["hiphop", "popping", "jazz"]
if sett.contains("locking") {
    print("locking is in sett.")
}
else {
    print("locking isn't in sett.")
}
sett.removeAll() //移除全部
sett = ["J", "L", "H", "P"]
for item in sett {
    print(item) //不一定照順序
}
for item in sett.sorted(){  //.sorted()能使其依序排列
    print(item)
}
var odd : Set = [1, 3, 5, 7]
let even : Set = [2, 4, 6, 8]
let single : Set = [2, 3, 5, 7]
odd.intersection(single).sorted() //交集
odd.union(even).sorted() //連集
odd.subtract(single) //除了...以外的值

//Dictionary 字典
var myDict2 = ["TYO": "Tokyo", "DUB": "Dublin"]
myDict2["TYO"] = nil //移除直設為nil

//控制流程
var three = 3

while three<3 {
    three += 1
}
//repeat-while：會先執行一次程式，再檢查條件表達式

repeat {
    three = three * 2
} while three < 30
print(three) //所以24之後會先*2

switch three {  //switch:將一個值與多個情況做比對
case 1...20:
    print("In 1~20")
case 21...45:
    print("In 21~45")
case 46, 47, 48, 49, 50:
    print("In 46~50")
default:
    print("not in")
}

let location = (2,3)
switch location {  //可以用原組比對
case (0,0):
    print("原點")
case (_, 0):   //用_表示忽略
    print("在x座標上")
case (0, _):
    print("在y座標上")
default:
    print("不在x,y座標及原點上")
}

switch three{
case 40...50 where three != 45:  //可以加入where條件
    print("小於50不是45")
default:
    print("是45")
}

//Continue：停止本次循環，開始此流程的下個循環

for n in 1...10{
    if n % 2 == 0 {
        continue  //印出1,3,5,7,9
    }
    print(n)
}
//Break
for n in 1...10{
    if n > 3 {
        break  //立即停止循環，只會印出1,2,3
    }
    print(n)
}

//Fallthrough：符合的話強制進行下一程序

var string = ""
var four = 4
switch four {
case 0,1,2,3:
    string += "one "
    fallthrough  //不符合
case 4,100,200:
    string += "two " //符合
    fallthrough
case 300,400:
    string += "three "
    fallthrough
default:
    string += "four " //結果： two three four
}

//流程加標籤

var one = 1
coolLoop: while one < 10 {
    switch one {
    case 1...4 :
        one += 1
    case 5:
        one *= 10
        break coolLoop  //結束while
    default:
        one += 1
    }
}
print(one)

//guard：提前退出，後面一定要加else

func post (artical: [String:String]) {  // 需要傳入一個型別為 [String: String] 的字典
    guard let insidetitle = artical["title"] else {  // 如果沒有鍵為 title 的值 這裡面的程式就會被執行
        print("沒有標題")
        return  // 函式中的 return 表示會直接結束這個函式
    }
    // 上面的 insideContent 如果有正確的被指派值 則會繼續進行到這裡
    print("標題：\(insidetitle)")
    
    guard let insidecontent = artical["content"] else {
        print("但是沒有內容")
        return  // 如果沒有鍵為 content 的值 這裡面的程式就會被執行
    }
    print("內容：\(insidecontent)")
}
post(artical: ["title":"有一隻鳥"])
post(artical: ["title":"有一隻鳥", "content":"他很可愛"])

//Function：函式
//元組:(2, 17.8, "hello") (型別可不同)
//陣列:[3, 3, 3] (有順序、可重複)
//集合:[2, 3, 4] (相同型別、沒順序、不能重複)
//字典:["TYO": "Tokyo", "DUB": "Dublin"] (鍵值對)

//函式返回值: ->型別{}
func simple(num:Int) -> Int{
    return (num + 10)
}
var meow = simple(num: 5)

//多重返回函式值：會以元組返回
func mul (num:Int) -> (Int, Int){
    return(num, num+5)
}
let f = mul(num: 5)
print("\(f.0) and \(f.1)")

    //也可以給元組的值加上名稱
func mul2 (me:String) ->(me:String, meme:String){
    return(me, me+"me")
}
let meme = mul2(me: "me")
    //這邊就可以使用先前加上的名稱呼叫
print("\(meme.me) name is \(meme.meme)")

func simple2(ss:String, aa:Int = 20) {  //預設值為20
    print("\(ss) 今年\(aa+1)歲")  //ss,aa 為被指派參數的常數，只能在函式內使用
}
simple2(ss:"Lulu") //若未傳入值時，帶入預設值

//函式可分外部(前)、內部(後)參數名稱，可以＿表示省略外部參數名稱
func hello (to name:String, and name2:String){
    print("Hello \(name) and \(name2)")
}
hello(to: "Sarah", and: "Jane") //沒有＿省略，所以呼叫要標示外部參數名稱
func hello2 (_ name:String, _ name2:String){
    print("Hello \(name) and \(name2)")
}
hello2("Jack", "Nancy") // 省略後，呼叫就不用寫外部參數名稱


//可變量參數:可以接受0或多個值
   //這個函數有Double...的變量參數，在函式內會轉成[Double]的陣列常數
func cal (much: Double...) -> Double {
    var totle : Double = 0
    for n in much {
        totle += n
    }
    return totle / Double(much.count) //型別要一樣，沒有宣告double會錯誤
}
print(cal(much: 1,2,3,4,5))

//In-Out Parameters：輸入輸出參數，傳入的參數在函式結束後改變仍然存在
func change (number: inout Int){
    number *= 2
}
var n = 10
change(number: &n)
print(n)  //這時n變成10

//如果函式返回可能為nil，可設為可選型別？
func maynil (arr : [Int]) -> (Int, Int)? {  //標註?
    if arr.isEmpty {
        return nil
    }
    let n = arr[0] + 10
    let m = arr[1] + 20
    return (n, m)
}

// if let：檢查變數是否有值，有值執行，空直跳出不執行
if let b = maynil(arr: []){  //因返回值為nil,所以不會印出
    print("Have \(b.0) and \(b.1)")
}
var mm:String?
var ll:String?
var dd:String?
    //if 里面的判断类型必须是Optional类型
if let i=mm, let m=ll, let n=dd { //可串接多個optional
    print("total=\(i)\(m)\(n)")
}

// gaurd let：同if let，不同的是當空值會執行後面{}
func showName(name: String?, phone: String?) {
   guard let newName = name ,let newphone = phone else { return } //若name是空值就return
   print("my name is \(newName), phone:\(newphone)") //可以用上面的宣告的變數
}
showName(name: "chen", phone: "0800")

func showNameif(name: String?) {
   if let newName = name {
      print("my name is \(newName)")
   }
    //newName 可在 guard let else { } 後繼續使用，不可在 if let else { } 後繼續使用
    //print("my name is \(newName)")
}

//把函式當成參數：函式可以作為另一個函式的參數
func addTwoInts (num1:Int, num2:Int) -> Int{
    return num1+num2
}
    //定義mathResult函式，有三個參數
    //宣告一個型別為(Int) -> Int的函式變數mathfunc，及其a,b兩個int參數，最後指派一個已經存在且型別相同的函式
func mathResult (mathfunc:(Int, Int) -> Int, a:Int, b:Int){
    print("Math result: \(mathfunc(a,b))")
}
mathResult(mathfunc: addTwoInts, a: 2, b: 3)

    //因有用＿省略外部名稱，所以呼叫不用外部參數名稱
func mathResult2 (_ mathfunc:(Int, Int) -> Int, _ a:Int, _ b:Int){
    print("Math result: \(mathfunc(a,b))")
}
mathResult2(addTwoInts, 2, 3)

//函式型別作為返回型別：函式A可以作為函式B的返回值
func forward(input:Int) -> Int{
    return input+1
}
func backward(input:Int) -> Int{
    return input-1
}
// 建立一個參數為布林值的函式，會return一個函式
func choosefunc(yesORno:Bool) -> (Int) -> Int{
    //true返回forward函式，false返回backward函式
    return yesORno ? forward : backward
}
let num = 3
    //宣告一個函式常數
let choose = choosefunc(yesORno:num>0) //num>0的結果為true，返回forward函式
print(choose(10)) //上面結果為choose=forward函式，因此10會帶入函式做計算

//巢狀函式：將函式定義在另一個函式中，只能在函式裡用，但也可以作為返回值讓其他地方用
func exchoosefunc(yesOrno:Bool) -> (Int) -> Int{
    func forward(input:Int) -> Int{
        return input + 1
    }
    
    func backward(input:Int) -> Int{
        return input - 1
    }
    
    return yesOrno ? forward : backward
}
let exchoose = exchoosefunc(yesOrno: num>0)
print(exchoose(10))  //以上面程式改寫
