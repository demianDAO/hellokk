import Array "mo:base/Array";
import Int "mo:base/Int";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  public func test(az : Int) : async Int {
    return az;
  }

};
