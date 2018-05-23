pragma solidity 0.4.23;


contract Visibility {
    // add a modifier but does not change default visibility of storage variable
    uint keepMeDefault = 0;
     
    modifier visibility {
        require(keepMeDefault == 0);
        _;
    }

    function makeMeVisible() public pure
      // make function visible externally and internally
    {
    }

    function makeMeHiddenFromOthers() private pure
      // make function visible only in the current contract
    {}

    function makeMeVisibleOnlyForFunctions() external pure
      // make function visible only via this.func
    {}

    function makeMeVisibleForChildContracts() internal pure
      // make function visible only internally
    {}
}
