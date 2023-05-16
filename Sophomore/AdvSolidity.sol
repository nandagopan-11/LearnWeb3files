// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

library Respond {
    function reply(string memory x) internal pure returns (string memory) {
        string memory  z = x;
        require(keccak256(bytes(z)) == keccak256(bytes(x)),"no argument");
        return x;
    }
}

contract AdvSolidity {

    address owner;
    string noun;

    constructor(string memory name) {
        owner = msg.sender;
        noun = name;
    }

    //mapping
    mapping (address => string) public moods;

    function getMood(address adrss)  public view returns (string memory) {
        return moods[adrss];
    }

    function setMood(string memory mood) public {
        moods[msg.sender] = mood;
    }

    //enums
    enum Status {
        STARTED,
        IN_PROGRESS,
        FINISHED,
        CANCELLED
    }

    mapping (uint256 => Status) State;

    function addId(uint256 id)  public  {
        State[id] = Status.STARTED;
    }

    function changeStatus(uint256 id)  public {
        State[id] = Status.IN_PROGRESS;
    }

    function getState(uint256 id) public view returns (Status) {
        return State[id];
    }

    //enums
    enum STATE {
        SENDING,
        SENT,
        DELIVERED,
        SEEN
    }

    //structs
    struct Message {
        string sndr;
        string message;
        STATE state;
    }

    //mapping
    mapping (uint256 => Message) chat;

    function chatting(uint256 id, string memory sender, string memory message)  public {
        
        chat[id] = Message(sender, message, STATE.SENT);

        chat[id] = Message({
            sndr: sender,
            message: message,
            state: STATE.SENT
        });

        Message memory mesg;
        mesg.sndr = sender;
        mesg.message = message;
        mesg.state = STATE.SENT;

        chat[id] = mesg;
    }

    //librarires
    function play(string memory word) public pure returns (string memory) {
        return Respond.reply(word);
    }

}

contract A {
    function trial() public virtual returns (string memory) {
        return "contract A";
    }
}

contract B is A {
    function trial() public virtual override returns (string memory) {
        return "contract B";
    }
}

contract C is A {
    function trial() public virtual override returns (string memory) {
        return "contract C";
    }
}

contract D is B,C{
    function trial() public virtual override(B,C) returns (string memory) {
        return super.trial();
    }
}

contract SendETH {
    function sendToken() public payable {
        address payable adrs = payable(msg.sender);
        uint256 amount = msg.value;

        (bool success,) = adrs.call{value: amount}("");
        require(success,"Unauthorized");
    }
}

contract Events {
    
    event Transfer(address from, address to);

    function sendNFT(address dest, address owner) public {
        
        require(owner == msg.sender,"cannot transfer");
        owner = dest;

        emit Transfer(msg.sender,dest);
    }
}
