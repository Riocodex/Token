// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Nosdog is ERC20Capped, ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;

    constructor( uint256 reward) ERC20("Nosdog", "NSD") ERC20Capped(cap * (10 ** decimals())) {
        owner = payable(msg.sender);
        _mint(owner, 1 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }

    function _mint(address account, uint256 amount) internal virtual override(ERC20Capped, ERC20) {
      
        require(balanceOf(msg.sender) <= 1, "Sorry, you can only buy 1 token");
        super._mint(account, amount);
    }

    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)) {
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from, to, value);
    }

    function setBlockReward(uint256 reward) public onlyOwner {
        blockReward = reward * (10 ** decimals());
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}