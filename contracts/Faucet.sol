// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

interface IERC20 {
    function transfer(address to, uint256 amount) external view returns(bool);
    function balanceOf(address account) external view returns(uint256);
}

contract Faucet{
    address payable owner;
}