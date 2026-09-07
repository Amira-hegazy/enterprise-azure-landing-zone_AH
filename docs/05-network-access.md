# Network access rules

Status: Proposed design. No network controls have been deployed or tested.

This document defines the planned network access rules for the
employee portal. It is not yet a complete connectivity specification.

## NET-01: Block non-production access to production

### Rule

Development and test application workloads must not initiate
network connections to production employee portal resources.

This restriction also applies to traffic routed through the hub.

### Rationale

Reduce the risk that testing activities, configuration mistakes,
or compromised non-production workloads affect the live portal.

### Planned verification

- Attempt connections from development workloads to production resources.
- Repeat the checks from test workloads.
- Verify that the intended network controls block these connections.
- Record the tested endpoints, protocols, ports, and observed results.

An unavailable destination alone is not evidence that this rule works.

### Scope boundary

This rule concerns application network traffic.

Azure management permissions and approved CI/CD deployment paths
will be designed separately. This rule does not grant deployment access.

### Open implementation details

The exact endpoints, protocols, ports, and network enforcement
points still need to be defined.
