pragma solidity 0.4.23;

import "truffle/Assert.sol";
import "../contracts/HelloWorld.sol";

contract HelloWorldTest {
    HelloWorld helloWorld = new HelloWorld();

    function testReturningHelloWorld() public {
        Assert.equal(keccak256(helloWorld.greet()), keccak256("Hola, Mundo!"),
            "Returned value isn't a \"Hola, Mundo!\" string");
    }
}
