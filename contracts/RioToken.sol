//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract RIOToken is ERC20Capped,Ownable {
    address payable public owner;
    uint256 public blockReward;
    constructor(uint256 cap, uint256 reward) ERC20("RIOTOKEN", "RIO") ERC20Capped(cap * (10 ** decimals())) {
        owner = msg.sender;
        _mint(owner, 70000000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }

    function _mintMinerReward() internal{
        _mint(block.coinbase, blockReward);
    }
    function _beforeTokenTransfer(address from, address to, uint256 value) 
    internal virtual override
    {
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)){
            _mintMinerReward();
        }
        super._beforeTokenTransfer(from,to,value )
    }   
    function setBlockReward(uint256 reward)public onlyOwner{
        blockReward = reward * (10 ** decimals());
    }

    function destroy() public onlyOwner {
        selfDestruct(owner);
    }


}