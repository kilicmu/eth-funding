pragma solidity ^0.5.10;
// import "./Request.sol";
import "./SupportContract.sol";
contract Funding{
    struct Request {
        string purpose;
        uint256 cost;
        address payable seller;
        uint256 accrossCount;
        RequestStates requestState;
        uint256 timeout;
        mapping(address=>bool) isVoted;
    }
    
    enum RequestStates{
        pending, resolved, reject
    }
    
    address manager;
    string projectName;
    uint256 targetMoney;
    uint256 supportMoney;
    uint256 endTime;
    address payable [] investors;
    Request[] requests;
    SupportContract supportFunding;
    mapping(address => bool) isInvestor;
    
    constructor(address _manager, string memory _projectName, uint256 _targetMoney, uint256 _supportMoney, uint256 _duration,SupportContract _supportFunding) public {
        manager = _manager;
        projectName = _projectName;
        targetMoney = _targetMoney* 10 **18;
        supportMoney = _supportMoney * 10 **18;
        endTime = block.timestamp + _duration;
        supportFunding = _supportFunding;
    }
    
    
    function invest() payable public{
        require(!isInvestor[msg.sender]);
        require(msg.value == supportMoney);
        investors.push(msg.sender);
        isInvestor[msg.sender] = true;
        supportFunding.setFunding(msg.sender, address(this));
    }
    
    function getInvestors() view public returns(address payable [] memory){
        return investors;
    }
    
    function getBalance() view public returns(uint256){
        return address(this).balance;
    }
    
    function refund() onlyManager public{
        for(uint256 i = 0; i < investors.length; i++){
            investors[i].transfer(supportMoney);
        }
        delete investors;
    }
    
    function createRequest(string memory _purpose, uint256 _cost, address payable _seller, uint256 _timeout) onlyManager public {
        requests.push(Request({
            purpose:_purpose,
            cost:_cost*10**18,
            seller: _seller,
            timeout: _timeout,
            accrossCount: 0,
            requestState: RequestStates.pending
        }));
    }
    
    function approveRequest(uint256 i) public {
        require(i <= requests.length);
        Request storage req = requests[i]; 
        require(!req.isVoted[msg.sender]);
        for(uint256 j = 0; j < investors.length; j++){
            if(investors[j] == msg.sender){
                req.accrossCount++;
                req.isVoted[msg.sender] = true;
                return;
            }
        }
        require(false);
    }
    
    function finalizeRequest(uint256 i)onlyManager payable public{
        require(i <= requests.length);
        Request storage req = requests[i];
        require(req.accrossCount*2 >= investors.length);
        require(getBalance() >= req.cost);
        req.seller.transfer(req.cost);
    }
    
    function getSurplusTime() view public returns(uint256){
        return endTime-block.timestamp;
    }
    
    function getInvestorsCounts() view public returns(uint256){
        return investors.length;
    }
    
    function getRequestCounts() view public returns(uint256){
        return requests.length;
    }
    
    function getRequestById(uint256 i) public returns(string memory, uint256, address, uint256, RequestStates, uint256){
        Request storage req = requests[i];
        return (req.purpose, req.cost, req.seller, req.accrossCount, req.requestState, req.timeout);
    }
    modifier onlyManager(){
        require(msg.sender == manager);
        _;
    }
}