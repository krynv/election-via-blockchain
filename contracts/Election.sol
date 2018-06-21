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

    // no way to iterate over the mapping
    // no way to get a count value either
    // counter cache to work out how many candidates exist
    // easy access to candidates in loop
    uint public candidatesCount;

    function Election() public {
        
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}