const { buildModule } = require('@nomicfoundation/hardhat-ignition/modules');

module.exports = buildModule('VotingModuleV2', (m) => {
  // Changed from 'VotingModule' to 'VotingModuleV2'
  // Define parameters with default values
  const candidateNames = m.getParameter('candidateNames', [
    'Mark',
    'Mike',
    'Henry',
    'Rock',
  ]);
  const durationInMinutes = m.getParameter('durationInMinutes', 1440);

  // Deploy the Voting contract
  const voting = m.contract('Voting', [candidateNames, durationInMinutes]);

  return { voting };
});
