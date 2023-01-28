//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";


contract RIOToken is ERC20Capped {
    address payable public owner;
    constructor(uint256 initialSupply) ERC20("RIOTOKEN", "RIO") {
        owner = msg.sender;
        _mint(owner, 70000000 * (10 ** decimals()));
    }
}