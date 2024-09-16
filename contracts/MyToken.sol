// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MyToken is ERC20, ERC20Permit, AccessControl {

    address public owner;
    uint myTokenTotalSupply = 1000 * 10 ** decimals();
    
    constructor() ERC20("MyToken", "MTK") ERC20Permit("MyToken") {
        owner = msg.sender;
        _mint(owner, 100 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, owner);
    }

    function mint(address to, uint256 amount) public onlyRole(DEFAULT_ADMIN_ROLE) {
        require(totalSupply() + amount <= myTokenTotalSupply, "");
        _mint(to, amount);
    }
}
