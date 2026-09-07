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


## NET-02: Block non-production access to the live HR system

### Rule

Development and test application workloads must not connect
to the live on-premises HR system.

This restriction also applies to connections through the hub
or shared intermediary services.

### Rationale

Protect real employee data and prevent development or testing
activities from affecting the live HR system.

### Planned test approach

Development and test will use a simulated HR interface with
synthetic employee records: fictional data with realistic formats.

Real employee records must not be copied into these test datasets.
The simulated interface must not forward requests to the live HR system.

This simulator is planned and has not been implemented.

### Planned verification

- Verify that connections from both development and test to the
  live HR system are blocked by the intended network controls.
- Record the tested endpoints, protocols, ports, and results.
- Confirm that the simulated interface uses only synthetic data
  and does not connect to the live HR system.

An unavailable destination alone is not evidence of effective blocking.

### Limitations and open details

Tests against the simulator do not prove that the real HR
integration, connectivity, performance, or recovery works.

The simulator design, exact endpoints, protocols, ports,
and enforcement controls remain to be defined.

Actual HR integration requires separately planned and approved
validation before operational acceptance. This does not grant
development or test access to the live HR system.
