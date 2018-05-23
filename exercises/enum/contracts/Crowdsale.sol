pragma solidity 0.4.23;


contract Crowdsale {
    // define Stage enum with Presale, Open and Closed values
    enum Stage {Presale, Open, Closed}

    Stage public stage = Stage.Closed;

    // require stage to be Presale or Open
    modifier whenNotClosed() {
        require(stage == Stage.Presale || stage == Stage.Open);
        _;
    }

    function rate() view public returns (uint) {
        // rate is 50x when presale
        if (stage == Stage.Presale){
            return 50;
        } else {
            return 5;
        }
        // rate is 5x otherwise
    }

    function buyTokens() view whenNotClosed public {
        // implementaton is irrelevant for this exercise
    }
}
