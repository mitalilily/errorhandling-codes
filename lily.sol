// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract mylily{
    address private owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    function deposit(uint amount) public {
        // Use require to check if the amount is greater than 0
        require(amount > 0, "Amount must be greater than 0");
        balance += amount;
    }

    function withdraw(uint amount) public {
        // Use assert to check if the balance is sufficient
        assert(balance >= amount);
        balance -= amount;
    }

    function transfer(address recipient, uint amount) public {
        // Use revert to cancel the transaction if the recipient is the zero address
        if (recipient == address(0)) {
            revert("Cannot transfer to the zero address");
        }
        balance -= amount;
        payable(recipient).transfer(amount);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
}
