pragma solidity ^0.8.17;

interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
 
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
 
 
//Actual token contract
 
contract Trailblaze_Deprec is ERC20Interface {
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
 
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
 
    // string public message;

    // event UpdatedMessages(string oldStr, string newStr);

    // constructor(string memory initMessage) {
    //     message = initMessage;
    // }

    // function update(string memory newMessage) public {
    //     string memory oldMsg = message;
    //     message = newMessage;
    //     emit UpdatedMessages(oldMsg, newMessage);
    // }

    constructor() {
        symbol = "TRB";
        name = "Trailblaze Token";
        decimals = 18;
        _totalSupply = 1_000_001_000_000_000_000_000_000; //1 mill + 1 and 18 zeros
        balances[0xfb3131da44E49C060fc15FfaA9d8c54412C1468A] = _totalSupply; //puts original total supply into my wallet
        emit Transfer(address(0), 0xfb3131da44E49C060fc15FfaA9d8c54412C1468A, _totalSupply);
    }
 
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
 
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
 
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
 
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
 
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from] - tokens;
        allowed[from][msg.sender] = allowed[from][msg.sender] - tokens;
        balances[to] = balances[to] + tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
 
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}