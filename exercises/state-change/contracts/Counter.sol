pragma solidity 0.4.23;

contract Counter {
    // define public count variable (uint) to store number of ticks
    uint public count;
    // implement tick() to increment counter
    function tick() public returns (uint){
        return count++;
    }
    // implement reset() to reset counter back to 0
    function reset() public {
        count = 0;
    }
}
