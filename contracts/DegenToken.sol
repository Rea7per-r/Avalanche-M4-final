// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.3/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.8.3/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.8.3/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    string public storeitems;
    constructor() ERC20("degen", "DG") {
        storeitems="Available items are: 1.Degen oversized-T, 2.Degen cargos, 3.Degen shirts, 4.Degen sneakers, 5.Degen Hoodie";
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    function redeemtoken(uint256 amount) public {
        require(amount<=5,"oops there's only 5 items in the shop");
        _burn(msg.sender,amount*1000);
    }

}
