//列舉
enum Point{
    case North
    case South
    case West
    case East
}
// 多個成員值可以寫在同一行 以逗號 , 隔開
enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

var direction = Point.North  // 型別為 CompassPoint 的一個變數 值為其列舉內的 West
direction = .South  // 如果要再指派新的值 可以省略列舉的型別名稱
switch direction {
    case .East:
        print("To the east.")
    case .North:
        print("To the north.")
    case .South:
        print("To the south.")
    default:
        print("To the west.")
}

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRcode(String)  //可以儲存宣告型別的值
}
var productBarcode = Barcode.UPCA(8, 8590, 5122, 3)
productBarcode = .QRcode("ABCCFGE")  //這時.UPCA會被.QRcode("ABCCFGE")取代
print(productBarcode)

switch productBarcode {  //可以在成員名稱前加let
case let .UPCA(numberSys, man, product, check):
    print("UPC-A: \(numberSys), \(man), \(product), \(check).")
case let .QRcode(productCode):
    print("QR Code: \(productCode).") //會印出這行，只有QRcode有值
}
/*  也等於
switch productBarcode {
case .UPCA(let numsys, let manu, let prod, let check):
    print("UPA-A: \(numsys),\(manu),\(prod),\(check)")
case .QRcode(let productCode):
    print("QRcode: \(productCode)")
} */

//宣告一週列舉，值為Int型態
//注意！原始值(rawValue)跟相關值不一樣，原始值始終都相同，成員相關值可以不一樣
enum WeekDAy:Int { //此為rawValue
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7
}
let today = WeekDAy.Friday
let tomorrow = WeekDAy.Saturday
//用rowValue屬性取得原始值
print(today.rawValue, tomorrow.rawValue)

// 第一個成員有原始值 1, 接著下去成員的原始值就是 2, 3, 4
enum SomePlanet:Int {  //可以不需要為每個成員設置rawVslue
    case Mercury=1,Venus,Earth,Mars,Jupiter,Saturn
}
let ourplanet = SomePlanet.Earth
print(ourplanet.rawValue)  //印出3

//rawVslue為String的列舉時，會直接將成員值設為原始值
enum Another:String {
    case North, South, East, West
}
let anotherdirection = Another.East
print(anotherdirection.rawValue) //印出East

//定義列舉時，如果使用了rawValue，則這個列舉會有一個初始化方法(method)，這個方法有一個名稱為rawValue的參數，其參數型別就是列舉rawValue的型別，返回值為列舉成員或nil
let position = 9  //先使用原始值9來找somplanet使否有9，但沒有所以返回nil接著執行else
if let target = SomePlanet(rawValue: position){
    switch target {
    case .Earth:
        print("We are in Earth !")
    default:
        print("Not Safe !")
    }
} else {
    print("No planet at postition \(position)")
    }

///類別(class)跟結構(struct)的共同：
//屬性(property)：用於儲存值
//方法(method)：用於提供功能
//下標(subscript)：用於存取值
//建構器(initializer)：用於生成初始化值
//擴展(extension)：增加預設實作的功能
//協定(protocol)：對某類別提供標準功能
///與結構相比，類別還有以下的其他功能：
//繼承(inherit)：類別可以繼承另一個類別的內容
//解構器(deinitializer)允許一個類別實體釋放任何其所被分配的資源
//型別轉換允許在執行時檢查和轉換一個類別實體的型別
//參考計數允許對一個類別實體的多次參考

struct CharacterStats{
    var hp = 0.0  //描述一個遊戲角色的狀態：血量跟法力
    var mp = 0.0
}
class GameCharacter {
    var stats = CharacterStats() //角色的狀態，會被初始化為CharacterStats結構的實體
    var attackSpeed = 1.0  //攻擊值預設1.0
    var name:String?  //名字則為可選型別String?，會被自動指派為一個預設值nil
}
//類別與結構都使用建構器語法來生成實體(instance)，建構器(initializer)最簡單的形式用()語法，這種方式建立的實體，其內的屬性都會被初始化為預設值
var someStats = CharacterStats()  //結構的實體
let someGameCharacter = GameCharacter()  //類別的實體
someStats.hp = 4.4

enum FryOrderSize {
    case large
    case small
}

//enum FastFoodMenultem {
//    case hamburger (numberOfPatties: Int)
//    case fries (size: FryOrderSize)
//    case drink (String, ounces: Int) // the unnamed string is the brand, e.g. "Coke"
//    case cookie
//    func isSpecial(number: Int) -> Bool {
//        switch self {
//        case .hamburger(let pattyCount): return pattyCount == number
//            ca
//        }
//    }
//}
//let menultem: FastFoodMenultem = FastFoodMenultem.hamburger (numberOfPatties: 2)
//var otherItem = FastFoodMenultem.cookie

