pragma solidity 0.4.23;

import "./strings.sol";


contract UsingStringUtils {
    using strings for *;

    function length(string _text) public pure returns (uint) {
        return _text.toSlice().len();
    }

    function greetings(string _name) public pure returns (string) {
        // concat name so returned string is: Hello, <name>!
        return "Hello, ".toSlice().concat(_name.toSlice()).toSlice().concat("!".toSlice());
    }
}
