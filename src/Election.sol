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

  constructor() public {
    addCandidate("Cedric Diggory", "Hogwarts School");
    addCandidate("Fleur Delacour", "Beauxbatons Academy of Magic");
    addCandidate("Viktor Krum", "Durmstrang Institute");
  }

  function addCandidate(
    string memory _candidateName,
    string memory _candidateSchool
  ) private {
    numberOfCandidates++;
    candidates[numberOfCandidates] = Candidate(
      numberOfCandidates,
      _candidateName,
      _candidateSchool,
      0
    );
  }
}
