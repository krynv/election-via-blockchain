pragma solidity ^0.4.17;

contract Election {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // like an associative array, or block
    // latter candidates value is a function that will allow
    // us to access the candidates
    mapping(uint => Candidate) public candidates;

    // store accounts that have voted as quick lookup
    mapping(address => bool) public voters;

    // no way to iterate over the mapping
    // no way to get a count value either
    // counter cache to work out how many candidates exist
    // easy access to candidates in loop
    uint public candidatesCount;

    // constructor
    function Election() public {
        addCandidate("Barry Chuckle");
        addCandidate("Paul Chuckle");
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // make a record of someone who voted
        // to ensure they have only voted once

        // have note voted before
        require(!voters[msg.sender]);

        // valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // have voted 
        voters[msg.sender] = true;

        // append to vote count
        candidates[_candidateId].voteCount++;
    }
}