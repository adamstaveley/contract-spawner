pragma solidity ^0.4.18;

import "../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract EMPToken is StandardToken {

    address private owner;
    string public name;
    string public symbol;
    uint8 public decimals;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function EMPToken(string _name, string _symbol, uint8 _decimals) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;  
    }

    function getName() view public returns (string) {
        return name;
    }
}