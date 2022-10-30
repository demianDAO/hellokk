import Array "mo:base/Array";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  //原始类型和复合类型

  // 1.整数-Int

  var first : Int = 4;
  let secod : Int = -5;
  let c : Int = 1_000_000;
  let d : Int = 0xf4; // 245

  // 2.自然数-Nat

  let a : Nat8 = 255; // Ok
  let a : Nat = 1;
  let b : Nat = 1_000_000;

  // 3. Bool

  let A = True;
  let B = False;

  if (A) {
    return B;
  }

  if (! B) {
    return B;
  }

  // 4.Char

  //请注意，char 类型必须用单引号指定，而 string 类型必须用双引号指定。

  let a : Char = 'A'; // Ok
  let b : Char = "B"; // Not ok
  let c : Text = "Hello, World!" // Ok
  let d : Text = 'Hello, World! ' // Not ok

  // 5.Text

  let e : Text = "Hello Kkdemian"

  for (c : Char in e.chars()) { ...c... }

  // 6.Blob

  type Blob = Prim.Types.Blob;
  Blob.size();
  t.vals();

  // 7.Float

  let a : Float = 0;
  let b : Float = -10.2;
  let c : Float = -0.3 e +15;
  let d : Float = 3.141_592_653_589_793;

  // 8.Principal
  //Principal 表示不透明的身份主体

  let a : Blob = "o2ivq-5dsz3-nba5d-pwbk2-hdd3i-vybeq-qfz35-rqg27-lyesf-xghzc-3ae";

  let account = a.toText(); //02d69f6686016af5f3ede8a2c31025e03d2e9287dbc073d138c7650f27d2deb2

  // 9.Error

  // import Error "mo:base/Error";

  // E.reject();

  switch (await Todo.markDoneResult(id)) {
    case (#err(#notFound)) {
      "There is no Todo with that ID.";
    };
    case (#err(#alreadyDone(at))) {
      let doneAgo = secondsBetween(at, Time.now());
      "You've already completed this todo " # Int.toText(doneAgo) # " seconds ago.";
    };
    case (#ok(seconds)) {
      "Congrats! That took " # Int.toText(seconds) # " seconds.";
    };
  };

  // 复合类型 tuble

  type person = (Text, Text);
  // intero matter lol

  let me = ("kk", "demian");

  type persons = (Text, Text, Nat);

  let me = ("kk", "demian", 29);

  let tub1 : (Nat) = (1); // Nat 1;

  let tup2 : (add1 : Nat, add2 : Nat, add3 : Nat3) = (1, 2, 3);

  // 取数据

  let operat = tup2.0;

  // 数组

  let arr1 : [Text] = ["arrd", "Feb", "op"]; // 长度固定

  let arr2 : [Text] = ["arrd", "Feb", 3];

  var arr3 : [Text] = ["ki", "arr2"]; //只能改变整个数组

  arr3[0] = "sub"; // error

  //Arrar.tabulate 函数生成一个数组;
  //通过索引访问

  ` ` ` let array1 : [Nat] = [1, 2, 3, 4, 6, 7, 8];

  let array2 : [Nat] = Array.tabulate<Nat>(
    7,
    func(i : Nat) : Nat {
      if (i == 2 or i == 5) { array1[i] * i } else { array1[i] };
    },
  );
  ` ` `

  // records

  type Student = {
    name : Text;
    school : Text;
    address : Text;
    var age : Nat; // 可变值
  }

  let student1 : Student = {
    name : "USA";
    school : "GST";
    address : "Caf";
    age : 50;
  }

  student1.age += 1; // ok
  student1.name := "beijing university"; // 不是var 改不了

  // 变体

  type vari = {
    #male : Nat;
    #female;
    #;
  }

  let va : vari = #male;

  let va : vari = #male(1);

  let va3 : vari = #female();

  // option ? 匹配到这个值

  type Person3 = {
    name : Text;
    surname : Text;
    var age : Nat;
    var status : Status;
    var partner : ?Person; // optional attribute
  };
  // 红色*的提示

  let person3 : Person3 = {
    name = "John";
    surname = "Doe";
    var age = 30;
    var status = #single;
    var partner = null; // we can assign null when there is no partner
  };

  // function

  public func add(x : Int, y : Int) : Int = x + y; // 默认类型

  private func addNum(x : Int, y : Int) : Int = x + y;

  // object
  object counter {
    public var count = 0;
    public func inc() { count += 1 };
  };

  // pattern
  func fullName({ first : Text; secod : Text; mid : Text; last : Text }) : Text {
    first # " " # secod # " " # mid # " " # last;
  };
  fullName(
    object {
      public let first = "1";
      public let first = "11";
      public let mid = "2";
      public let last = "3";
    },
  )
  // actor

};

actor Broadcast {
  type Receiver = actor { recv : query Text -> async Nat };

  var r : [Receiver] = [];

  public func register(a : Receiver) {
    r := Array.append(r, [a]);
  };

  public func send(t : Text) : async Nat {
    var sum = 0;
    for (a in r.vals()) {
      sum += await a.recv(t);
    };
    return sum;
  };

  // 运算符
  let vr1 : Nat = 1;
  let vr2 : Nat = 2;
  var vr3 = vr1 + vr2;

  if (vr1 and vr2) {
    return vr3;
  };
};
