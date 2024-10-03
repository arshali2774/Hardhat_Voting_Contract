# Voting Smart Contract

This repository contains a Hardhat project for a decentralized voting system implemented as an Ethereum smart contract.

## Overview

The Voting smart contract allows for a transparent and secure voting process. It includes features such as:

- Adding candidates
- Casting votes
- Checking voting status
- Retrieving remaining voting time
- Getting candidate details and vote counts

## Prerequisites

- Node.js (v14.0.0 or later)
- npm (v6.0.0 or later)
- Hardhat

## Installation

1. Clone this repository:

   ```
   git clone https://github.com/your-username/voting-smart-contract.git
   cd voting-smart-contract
   ```

2. Install dependencies:
   ```
   npm install
   ```

## Usage

1. Compile the smart contract:

   ```
   npx hardhat compile
   ```

2. Deploy the smart contract:
   ```
   npm run deploy
   ```

This command uses the deployment script defined in the `package.json` file, which utilizes Hardhat Ignition for deployment.

## Contract Functions

- `addCandidate(string memory _name)`: Add a new candidate to the election.
- `vote(uint256 _candidateIndex)`: Cast a vote for a candidate.
- `getVotingStatus()`: Check if voting is still open.
- `getRemainingTime()`: Get the remaining time for voting.
- `getCandidatesNum()`: Get the total number of candidates.
- `getCandidateInfo(uint256 _index)`: Get information about a specific candidate.

## Frontend Integration

This smart contract is designed to work with a React frontend. Make sure to update the `contractAddress` in your frontend code after deploying the contract.

## License

This project is licensed under the MIT License.
