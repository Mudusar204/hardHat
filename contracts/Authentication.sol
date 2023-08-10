// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Authentication {
    struct User {
        string name;
        string email;
        string password;
    }

    User[] public users;

    function doSignup(
        string memory name,
        string memory email,
        string memory password
    ) public returns (string memory) {
        User memory newUser = User(name, email, password);
        users.push(newUser);
        return "Successfully Signed Up";
    }

    function getUsers() public view returns (User[] memory) {
        return users;
    }

    function compareStrings(
        string memory a,
        string memory b
    ) internal pure returns (bool) {
        return (keccak256(abi.encodePacked(a)) ==
            keccak256(abi.encodePacked(b)));
    }

    function isUserExists(
        User memory userToCheck
    ) internal view returns (bool) {
        for (uint256 i = 0; i < users.length; i++) {
            bool isEmailEqual = compareStrings(
                users[i].email,
                userToCheck.email
            );
            bool isPasswordEqual = compareStrings(
                users[i].password,
                userToCheck.password
            );

            if (isEmailEqual && isPasswordEqual) {
                return true;
            }
        }
        return false;
    }

    function doLogin(
        string memory email,
        string memory password
    ) public view returns (bool) {
        User memory n = User("", email, password);
        return isUserExists(n);
    }
}
