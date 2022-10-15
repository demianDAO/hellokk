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

};
