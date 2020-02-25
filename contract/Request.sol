pragma solidity ^ 0.5.10;


contract Request {
    string purpose;
    uint256 public cost;
    address public seller;
    uint256 public accrossCount;
    RequestStates requestState;
    uint256 timeout;
    mapping(address=>bool) isVoted;
    
    enum RequestStates{
    pending, resolved, reject
    }
    
    constructor(string memory _purpose, uint256 _cost, address _seller, uint256 _timeout) public {
        require(_timeout >= 60*60*24*3);
        purpose = _purpose;
        cost = _cost;
        seller = _seller;
        accrossCount = 0;
        requestState = RequestStates.pending;
        timeout = _timeout;
    }
    
    function accross(address _sender)public{
        require(!isVoted[_sender]);
        isVoted[_sender] = true;
        ++accrossCount;
    }
    
}
