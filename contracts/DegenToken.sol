// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    struct storeitems {
        string name;
        uint256 price;
    }

    mapping(uint256 => storeitems) public store;

    constructor() ERC20("degen", "DG") {
        store[1] = storeitems("Degen oversized-T", 2000);
        store[2] = storeitems("Degen cargos", 4000);
        store[3] = storeitems("Degen shirts", 100);
        store[4] = storeitems("Degen sneakers", 10000);
        store[5] = storeitems("Degen Hoodie", 6000);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function redeemToken(uint256 itemId) public {
        require(itemId >= 1 && itemId <= 5, "Invalid item ID");
        require(balanceOf(msg.sender) >= store[itemId].price, "Insufficient balance");

        _burn(msg.sender, store[itemId].price);
        emit ItemPurchased(msg.sender, store[itemId].name);
    }

    event ItemPurchased(address  buyer, string item);
}
