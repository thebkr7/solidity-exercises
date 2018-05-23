pragma solidity 0.4.23;

import "../../iterable-mapping/contracts/Airdrop.sol";


contract Events is Airdrop {
    // define AddressAdded(addr) event
    event AddressAdded(address addr);

    // define AddressRemoved(addr) event
    event AddressRemoved(address addr);

    // define Airdrop(value, recipientsNum) event
    event Airdrop(uint value, uint recipientsNum);

    function addAddress(address _address) public {
        // use super to call addAddress(address) from Airdrop
        super.addAddress(_address);
        emit AddressAdded(_address);
    }

    function removeAddress(address _address) public {
        // emit AddressAdded event using low-level log1 function insteadof emit
        super.removeAddress(_address);
        emit AddressRemoved(_address);
    }

    function airdrop(uint _value) public {
        // emit Airdrop event
        super.airdrop(_value);
        emit Airdrop(_value, addresses.length);
    }
}
