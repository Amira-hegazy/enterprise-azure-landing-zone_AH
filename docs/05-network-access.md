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


## NET-03: Restrict production portal access to the HR system

### Rule

For portal application traffic, only the designated production
portal backend may initiate connections to the HR interface
needed for employee profile retrieval.

The permitted source, destination endpoints, protocols, and ports
must be explicitly approved before access is enabled.
Other portal-to-HR connections must be blocked.

The development and test restrictions in NET-02 remain unchanged.

### Rationale

Support the portal's required HR integration while limiting
unnecessary network access and exposure of employee information.

### Required application and identity controls

The backend must authenticate to the HR interface.
Its HR permissions must allow only the required read operations
for department and work-contact information, not HR data changes.

The portal must authenticate each employee and enforce access
to that employee's own profile on every request.
Changing a requested employee identifier must not expose
another employee's information.

These checks require application and identity controls.
Network rules alone cannot enforce read-only or own-profile access.

### Connection protection

HR requests must use encrypted transport.
The site-to-site VPN remains a provisional connectivity choice;
see [ADR 001](decisions/001-hybrid-connectivity.md).

The HR interface must not be exposed publicly for this integration.

### Planned verification

- Verify successful permitted profile requests from the production backend.
- Verify that prohibited sources, destinations, and ports are blocked.
- Verify rejection of unauthorized profile requests and HR write operations.
- Confirm that development and test cannot access the live HR system.
- Record the controls tested and the observed results.

Tests involving the live HR system require prior approval
and safeguards against operational disruption.

### Open details and evidence status

The HR interface, endpoints, protocols, ports, authentication method,
identity-to-employee mapping, permissions, and enforcement controls
remain to be designed and approved.

No production HR connection or related access controls have been
implemented or tested in this case study.
