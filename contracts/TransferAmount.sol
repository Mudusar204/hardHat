// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;
///////////////////////////////////transfer amount contract/////////////////////////////
contract TransferAmount {
    struct TransactionDetail {
        address from;
        address to;
        uint256 amount;
        uint256 nonce;
        uint256 gasfee;
    }

    mapping(address => TransactionDetail[]) public transactionHistory;

    function payToOtherAccount(address payable receiverAccount) public payable {
        require(msg.value > 0, "Amount must be greater than 0");

        TransactionDetail memory newTransaction = TransactionDetail({
            from: msg.sender,
            to: receiverAccount,
            amount: msg.value,
            nonce: block.number,
            gasfee: tx.gasprice
        });

        transactionHistory[msg.sender].push(newTransaction);

        receiverAccount.transfer(msg.value);
    }

    function getTransactionHistory(
        address account
    ) external view returns (TransactionDetail[] memory) {
        return transactionHistory[account];
    }
}

////////////////////////////////////////////Deposit and withdrawl amount contract/////////////////////////
contract DepositAmount is TransferAmount{
    mapping(address => uint256) public balance;

    function depositAmount() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        balance[msg.sender] += msg.value;
         TransactionDetail memory newTransaction = TransactionDetail({
            from: msg.sender,
            to: address(this),
            amount: msg.value,
            nonce: block.number,
            gasfee: tx.gasprice
        });

        transactionHistory[msg.sender].push(newTransaction);
    }

    function checkAccountBalance(address account) public view returns (uint256) {
        return balance[account];
    }

    function withdrawAmount(address account,uint256 amount) public {
        require(checkAccountBalance(account) >= amount, "there is no enough amount");

        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
         TransactionDetail memory newTransaction = TransactionDetail({
            from: address(this),
            to: msg.sender,
            amount: amount,
            nonce: block.number,
            gasfee: tx.gasprice
        });

        transactionHistory[msg.sender].push(newTransaction);
    }

    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
