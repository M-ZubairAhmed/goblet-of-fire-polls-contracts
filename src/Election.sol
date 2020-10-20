// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract Election {
  // Model of the candidate
  struct Candidate {
    uint256 id;
    string name;
    string school;
    uint256 votes;
  }

  // Persists candidates in storage
  mapping(uint256 => Candidate) public candidates;

  // To keep track of list of candidates in election
  uint256 public numberOfCandidates;

  // Persists all voters address in storage
  mapping(address => bool) public voters;

  event VoteCasted(uint256 _candidateId);

  constructor() public {
    addCandidate("Cedric Diggory", "Hogwarts School");
    addCandidate("Fleur Delacour", "Beauxbatons Academy of Magic");
    addCandidate("Viktor Krum", "Durmstrang Institute");
  }

  // To add list of candidates to election
  function addCandidate(
    string memory _candidateName,
    string memory _candidateSchool
  ) private {
    // increment candidate id
    numberOfCandidates++;

    // store candidates into the mapping
    candidates[numberOfCandidates] = Candidate(
      numberOfCandidates,
      _candidateName,
      _candidateSchool,
      0
    );
  }

  // To vote for a candidate
  function voteCandidate(uint256 _candidateId) public {
    // check if voter has not voted before
    require(!voters[msg.sender], "User already voted");

    // check if vote is towards valid candidate
    require(
      _candidateId > 0 && _candidateId <= numberOfCandidates,
      "Invalid candidate to vote for"
    );

    // if all conditions are valid then proceed by adding the voter to mapping
    voters[msg.sender] = true;

    // up the candidates votes
    candidates[_candidateId].votes++;

    // send off an event that vote has been casted
    emit VoteCasted(_candidateId);
  }
}
