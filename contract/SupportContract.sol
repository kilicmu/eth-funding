pragma solidity ^0.5.10;

contract SupportContract {
    mapping(address=>address[]) supportFundings;
    
    function setFunding(address a1, address a2) public {
        supportFundings[a1].push(a2);
    }
    
    function getFundings(address a) public view returns(address[] memory){
        return supportFundings[a];
    }
}