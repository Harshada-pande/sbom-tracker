# sbom-tracker
## SBOM Integrity Tracker
# Blockchain-based SBOM Integrity Tracker

A tamper-proof Software Bill of Materials (SBOM) 
registry built on Ethereum. Every software component 
is hashed and stored on-chain — making tampering 
detectable and the entire dependency chain auditable.

## Problem It Solves
Supply chain attacks like SolarWinds happened because 
tampered software components went undetected. This 
system makes that impossible — once a component hash 
is registered on-chain, it cannot be altered.

## Features
- Register software components with SHA256 hash
- Verify component integrity on demand
- Detect and log tampering as on-chain event
- Maintain full version history per component

## Tech Stack
- Solidity ^0.8.0
- Ethereum (Sepolia Testnet)
- Remix IDE

## Deployed Contract
**Network:** Ethereum Sepolia Testnet  
**Contract Address:** 0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd  
**Etherscan:** https://sepolia.etherscan.io/address/0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd

## How It Works
1. At build time — component name, version and hash 
   are registered on-chain
2. At deployment — system re-hashes and compares
3. Any mismatch — TamperDetected event fired on-chain
4. Full audit trail maintained permanently

## Functions
| Function | Description |
|----------|-------------|
| registerComponent | Register a component with its hash |
| verifyComponent | Verify integrity, detect tampering |
| getComponent | Fetch component details |
| getVersionHistory | Get full version audit trail |

Blockchain-based software component integrity verification system.

**Contract Address (Sepolia):** 0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd

**Etherscan:** https://sepolia.etherscan.io/address/0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd

Blockscout Verification - https://eth-sepolia.blockscout.com/address/0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd?tab=contract

Sourcify Verification- 
https://repo.sourcify.dev/11155111/0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd

Routescan Verification -
https://testnet.routescan.io/address/0x9B5A0D5d0C81A584653866cDa0A91ECCdB551fDd/contract/11155111/code




