// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

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
