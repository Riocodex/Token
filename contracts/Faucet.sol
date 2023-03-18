// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface IERC20 {
    function transfer(address to, uint256 amount) external view returns(bool);
    function balanceOf(address account) external view returns(uint256);
}

contract Faucet{
    address payable owner;
    IERC20 public token;

    uint256 public withdrawalAmount = 50 * (10**18);
    constructor(address tokenAddress) payable{
        token = IERC20(tokenAddress);
        owner = payable(msg.sender); 
    }

    function requestTokens() public{
        require(msg.sender != address(0), "Request must not originate from a zero Account");
        token.transfer(msg.sender, withdrawalAmount); 
    }
}