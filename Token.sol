// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// deploy with initialSupply == 1000
// transfer 20 tokens to player
contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transferTokens(address _to, uint256 _value) public returns (bool) {
    unchecked {
        require(balances[msg.sender] - _value >= 0, "check failed");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
    }
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}
