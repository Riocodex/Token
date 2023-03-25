// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Nosdog is ERC20Burnable {
    address payable public owner;
    uint256 public blockReward;
    uint256 price = 0.0003 ether;

    constructor( ) payable ERC20("Nosdog", "NSD") {
        owner = payable(msg.sender);
        
    }

    function getTokens()public payable{
        require(msg.value >= price, "not enough ether to buy token");
        _mint(owner, 1 * (10 ** decimals()));
    }

    function _mint(address account, uint256 amount) internal virtual override( ERC20) {
        super._mint(account, amount);
    }

   

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override {
        if(from != address(0) && to != block.coinbase && block.coinbase != address(0)) {
           
        }
        super._beforeTokenTransfer(from, to, value);
    }

    

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }

    function returnBalance()public view returns(uint256){
        return address(this).balance;

    }
    function withdraw() public {
        require(owner.send(address(this).balance));
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }


}