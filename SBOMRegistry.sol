// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SBOMRegistry {

    // Data structure for one component version
    struct Component {
        string name;
        string version;
        bytes32 hash;
        address registeredBy;
        uint256 timestamp;
        bool exists;
    }

    // Storage
    // key = keccak256(name + version) → Component
    mapping(bytes32 => Component) private components;

    // Track all versions of a component by name
    mapping(string => string[]) private versionHistory;

    // Events
    event ComponentRegistered(
        string name,
        string version,
        bytes32 hash,
        address registeredBy,
        uint256 timestamp
    );

    event TamperDetected(
        string name,
        string version,
        bytes32 expectedHash,
        bytes32 providedHash,
        uint256 timestamp
    );

    // ─────────────────────────────────────────
    // FUNCTION 1: Register a component
    // ─────────────────────────────────────────
    function registerComponent(
        string memory _name,
        string memory _version,
        bytes32 _hash
    ) public {
        bytes32 key = keccak256(abi.encodePacked(_name, _version));

        // Prevent overwriting existing registration
        require(!components[key].exists, "Component version already registered");

        components[key] = Component({
            name: _name,
            version: _version,
            hash: _hash,
            registeredBy: msg.sender,
            timestamp: block.timestamp,
            exists: true
        });

        versionHistory[_name].push(_version);

        emit ComponentRegistered(_name, _version, _hash, msg.sender, block.timestamp);
    }

    // ─────────────────────────────────────────
    // FUNCTION 2: Verify a component
    // ─────────────────────────────────────────
    function verifyComponent(
        string memory _name,
        string memory _version,
        bytes32 _hashToCheck
    ) public returns (string memory) {
        bytes32 key = keccak256(abi.encodePacked(_name, _version));

        require(components[key].exists, "Component not registered");

        if (components[key].hash == _hashToCheck) {
            return "VERIFIED: Component is intact";
        } else {
            emit TamperDetected(
                _name,
                _version,
                components[key].hash,
                _hashToCheck,
                block.timestamp
            );
            return "TAMPERED: Hash mismatch detected";
        }
    }

    // ─────────────────────────────────────────
    // FUNCTION 3: Get component details
    // ─────────────────────────────────────────
    function getComponent(
        string memory _name,
        string memory _version
    ) public view returns (
        bytes32 hash,
        address registeredBy,
        uint256 timestamp
    ) {
        bytes32 key = keccak256(abi.encodePacked(_name, _version));
        require(components[key].exists, "Component not registered");

        Component memory c = components[key];
        return (c.hash, c.registeredBy, c.timestamp);
    }

    // ─────────────────────────────────────────
    // FUNCTION 4: Get all versions of a component
    // ─────────────────────────────────────────
    function getVersionHistory(
        string memory _name
    ) public view returns (string[] memory) {
        return versionHistory[_name];
    }
}