// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner = msg.sender;

    receive() external payable {
        emit Deposit(msg.value);

    }

    function withdraw() external payable {
        require(msg.sender == owner, "Not wallet owner" );
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender)); 
    }
}