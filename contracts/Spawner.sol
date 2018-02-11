pragma solidity ^0.4.18;

import "./EMPToken.sol";

contract Spawner {
  address private owner;

  event TokenCreation(address indexed location);

  mapping(address => address) public Tokens;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
  function Spawner() public {
    owner = msg.sender;
  }

  function newToken(address _owner, string _name, string _symbol, uint8 _decimals) public onlyOwner {
    address token = new EMPToken(_name, _symbol, _decimals);
    Tokens[_owner] = token;
    TokenCreation(token);
  }

  function getTokenAddress() view public returns (address) {
    return Tokens[msg.sender];
  }

}
