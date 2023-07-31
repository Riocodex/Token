// SPDX-License-Identifier: MIT
// unmonetizedcontract deployed in sepolia network @0xfc6Ab2cb908cc35FBF567eE4D6D5Fd244c43153e
// monetizedcontract deployed in sepolia network @0x6bF41505c9f996e542CA6Adba9123AE00d5704CD
pragma solidity ^0.8.17;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract FaucetBusd {
    address payable owner;
    IERC20 public token;

    uint256 public withdrawalAmount = 50 * (10**18);
    uint256 public lockTime = 1 minutes;

    event Withdrawal(address indexed to, uint256 indexed amount);
    event Deposit(address indexed from, uint256 indexed amount);
    event FeePaid(address indexed from, uint256 indexed amount);
    event EthWithdrawn(address indexed by, uint256 indexed amount);

    mapping(address => uint256) nextAccessTime;

    constructor(address tokenAddress) payable {
        token = IERC20(tokenAddress);
        owner = payable(msg.sender);
    }

    function requestTokens(address recipient) public payable {
        require(
            msg.sender != address(0),
            "Request must not originate from a zero account"
        );
        require(
            token.balanceOf(address(this)) >= withdrawalAmount,
            "Insufficient balance in faucet for withdrawal request"
        );
        

        token.transfer(recipient, withdrawalAmount); // Transfer tokens to the specified recipient

        emit Withdrawal(recipient, withdrawalAmount); // Emit Withdrawal event for the specified recipient
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function getBalance() external view returns (uint256) {
        return token.balanceOf(address(this));
    }
      
    function setWithdrawalAmount(uint256 amount) public onlyOwner {
        withdrawalAmount = amount * (10**18);
    }

    function setLockTime(uint256 amount) public onlyOwner {
        lockTime = amount * 1 minutes;
    }

    function withdraw() external onlyOwner {
        emit Withdrawal(msg.sender, token.balanceOf(address(this)));
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    function withdrawEth() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "There is no ETH to withdraw");
        owner.transfer(balance);
        emit EthWithdrawn(owner, balance);
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function"
        );
        _;
    }
}
