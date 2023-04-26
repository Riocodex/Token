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
    uint256 public lockTime = 1 minutes;

    mapping(address => uint256) nextAccessTime;
    constructor(address tokenAddress) payable{
        token = IERC20(tokenAddress);
        owner = payable(msg.sender); 
    }

    function requestTokens() public{
        //checking if the request is coming from an original account
        require(msg.sender != address(0), "Request must not originate from a zero Account");
        require(token.balanceOf(address(this)) >= withdrawalAmount, "Insufficient balance in faucet for withdrawal");
        require(block.timestamp >= nextAccessTime[msg.sender],"insufficient time elapsed since last withdraw - try again later");

        nextAccessTime[msg.sender] = block.timestamp + lockTime; 
        token.transfer(msg.sender, withdrawalAmount); 
    }
}