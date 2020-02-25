pragma solidity ^0.5.10;
import "./SupportContract.sol";
import "./Funding.sol";

contract FundingFactory {
    address platformManager;
    address[] allFundings;
    mapping (address=>address[]) createdFundings;
    SupportContract supportContract;
    
    constructor() public {
        platformManager = msg.sender;
        supportContract = new SupportContract();
    }
    
    function createFunding(string memory _projectName, uint _targetMoney, uint _supportMoney, uint _duration) public {
        Funding funding = new Funding(platformManager, _projectName, _targetMoney, _supportMoney, _duration,supportContract);
        allFundings.push(address(funding));
        createdFundings[msg.sender].push(address(funding));
    }
    
    function getAllFundings() view public returns(address[] memory){
        return allFundings;
    }
    
    function getCreatorFundings()view public returns(address[] memory){
        return createdFundings[msg.sender];
    }
    
    function getInvestedFundings()view public returns(address[] memory){
        return supportContract.getFundings(msg.sender);
    }
}