# Decentralized Donation App  

This project demonstrates the development and deployment of a secure, decentralized donation contract using Solidity and Ethereum Sepolia Testnet. The application ensures transparency and security in managing donations, leveraging Chainlink oracles for price conversion and implementing essential security patterns like CEI and owner-restricted functions.  

## Features  

- **Donation Tracking**: Records donor addresses and their contributions.  
- **Minimum USD Requirement**: Enforces a minimum donation amount using Chainlink's ETH/USD price feed.  
- **Withdrawal Functionality**: Allows only the contract owner to withdraw funds securely.  
- **Fallback Donations**: Handles direct ETH transfers using `receive()` and `fallback()`.  
- **Security Measures**: Implements reentrancy protection with the Checks-Effects-Interactions (CEI) pattern.  

## Challenges Faced  

- **Obtaining Testnet Tokens**: The most significant challenge was acquiring Sepolia testnet ETH for deployment and testing. Faucets often had long delays or limited token availability, which required patience and searching for reliable sources.  
- **Integration with Chainlink Oracles**: Understanding and integrating the Chainlink AggregatorV3Interface for ETH/USD conversion took time but provided valuable insight into oracle interactions.  
- **Testing Edge Cases**: Simulating unauthorized actions and low-value donations helped ensure the contract's robustness.  

## Setup and Deployment  

1. **Environment Setup**:  
   - Configured MetaMask for the Ethereum Sepolia Testnet.  
   - Used Remix IDE for writing and deploying contracts.  

2. **Contract Files**:  
   - `Donation.sol`: Contains the main contract logic.  
   - `PriceConverter.sol`: Handles ETH to USD conversion using Chainlink oracles.  

3. **Deployment**:  
   - Deployed `Donation.sol` on Sepolia Testnet using the Chainlink ETH/USD price feed at `0x694AA1769357215DE4FAC081bf1f309aDC325306`.  

## Testing  

- **Donations**: Verified that the `fund()` function only accepts donations meeting the minimum USD requirement.  
- **Withdrawals**: Ensured only the contract owner could call the `withdraw()` function.  
- **Rejection Cases**: Confirmed that invalid donations and unauthorized withdrawals revert as expected.  

## Insights  

This project provided hands-on experience with:  
- Writing secure smart contracts in Solidity.  
- Integrating external oracles like Chainlink for real-world data.  
- Deploying and interacting with Ethereum test networks.  

## Contract Addresses  

- `Donation.sol`: [Add Deployed Address]  
- `PriceConverter.sol`: [Add Deployed Address]  

## Conclusion  

This project was a fulfilling exercise in creating a decentralized donation system that is secure and user-friendly. The experience reinforced key concepts in Solidity development, security best practices, and interacting with blockchain ecosystems.  

> **Note**: Ensure sufficient Sepolia testnet ETH before starting. Use trusted faucets to avoid delays.  
