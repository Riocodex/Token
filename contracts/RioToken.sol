//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract RIOToken is ERC20 {
    address payable public owner;
    constructor(uint256 initialSupply) ERC20("RIOTOKEN", "RIO") {
        owner = msg.sender;
        _mint(owner, 70000000 * (10 ** decimals()));
    }
}