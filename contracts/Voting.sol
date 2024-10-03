// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // A candidate should have name and vote count
    struct Candidate {
        string name;
        uint256 voteCount;
    }
    // An array of candidates
    Candidate[] public candidates;
    // The owner of the contract
    address owner;
    // A mapping of addresses to whether they have voted
    mapping(address => bool) public voters;

    // The start and end times of the voting period
    uint256 public votingStart;
    uint256 public votingEnd;

    /**
     * @dev Constructor for the Voting contract
     * @param _candidateNames An array of the names of the candidates
     * @param _durationInMinutes The duration of the voting period in minutes
     */
    constructor(string[] memory _candidateNames, uint256 _durationInMinutes) {
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(
                Candidate({name: _candidateNames[i], voteCount: 0})
            );
        }
        owner = msg.sender; // Set the owner to the contract deployer
        votingStart = block.timestamp;
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    /**
     * @dev Modifier to check if the caller is the owner
     */
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Function to add a new candidate
     * @param _name The name of the candidate to add
     */
    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(Candidate({name: _name, voteCount: 0}));
    }

    /**
     * @dev Function to vote for a candidate
     * @param _candidateIndex The index of the candidate to vote for
     */
    function vote(uint256 _candidateIndex) public {
        require(!voters[msg.sender], "You have already voted."); // Check if the voter has already voted
        require(
            _candidateIndex < candidates.length,
            "Invalid candidate index."
        ); // Check if the candidate index is valid

        candidates[_candidateIndex].voteCount++; // Increment the vote count for the Candidate
        voters[msg.sender] = true; // Mark the voter as having voted
    }

    /**
     * @dev Function to get all the votes of the candidates
     * @return An array of the candidates and their vote counts
     */
    function getAllVotesOfCandiates() public view returns (Candidate[] memory) {
        return candidates;
    }

    /**
     * @dev Function to get the voting status
     * @return True if the voting is still ongoing, false otherwise
     */
    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    /**
     * @dev Function to get the remaining time of the voting period
     * @return The remaining time in seconds
     */
    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet.");
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return votingEnd - block.timestamp;
    }
}
