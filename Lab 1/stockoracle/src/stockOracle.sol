pragma solidity ^0.5.16;

contract StockMarket {
    
    struct stock {
        uint256 price;
        uint256 volume;
    }
    
    mapping (bytes4 => stock) stockQuote;
    
    address oracleOwner;    
    
    constructor() public {
        oracleOwner = msg.sender;
    }
    
    
    function setStock (bytes4 _symbol, uint256 _price, uint256 _volume) public {
        require(msg.sender == oracleOwner, "Error: Only owner allowed");
        require(_price>=1, "Error: Invalid price");
        stockQuote[_symbol].price = _price;
        stockQuote[_symbol].volume = _volume;
    }
    
    function getStockPrice (bytes4 _symbol) public view returns(uint256) {
        return (stockQuote[_symbol].price);
    }
    
    function getStockVolume (bytes4 _symbol) public view returns(uint256) {
        return  (stockQuote[_symbol].volume);
    }
}