# IP address plan

Status: Proposed example for this fictional case study.
No Azure networks have been deployed.

## Scope

This initial plan covers the shared hub and the employee portal's
development, test, and production networks.

It is not a complete enterprise address inventory.

## Proposed VNet address ranges

| Network | Proposed IPv4 CIDR | Address range |
|---|---|---|
| Hub | `10.20.0.0/20` | `10.20.0.0` to `10.20.15.255` |
| Development | `10.20.16.0/20` | `10.20.16.0` to `10.20.31.255` |
| Test | `10.20.32.0/20` | `10.20.32.0` to `10.20.47.255` |
| Production | `10.20.48.0/20` | `10.20.48.0` to `10.20.63.255` |

## Proposed hub gateway subnet

- Parent hub VNet: `10.20.0.0/20`
- Required subnet name: `GatewaySubnet`
- Proposed subnet CIDR: `10.20.0.0/27`
- Address range: `10.20.0.0` to `10.20.0.31`

This subnet is intended for the planned Azure VPN gateway.
It is contained within the proposed hub VNet address range.

Do not deploy portal applications or other application workloads
into GatewaySubnet.

Do not associate a network security group (NSG) with GatewaySubnet.
NSGs are not supported on this special subnet.

The /27 size is provisional and must be checked against the
final gateway configuration and expected growth.

The VPN connectivity decision remains provisional.
Defining this subnet does not deploy a gateway or enforce
the network access rules.

[Microsoft: Gateway subnet requirements](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpn-gateway-settings#gateway-subnet)

## Rationale and sizing assumptions

These private IPv4 ranges do not overlap with each other.

Each /20 block contains 4,096 total addresses.
This does not mean 4,096 usable workload addresses.
Subnet allocations, Azure reservations, and service-specific
requirements must be considered separately.

The /20 size is an illustrative starting assumption,
not a validated capacity requirement.

The number of portal users alone does not determine
the required number of network addresses.

## Conditions before implementation

- Inventory existing Azure and on-premises address ranges.
- Confirm that the proposed ranges do not overlap with any
  existing or planned connected networks.
- Validate sizing against the selected services, subnet needs,
  scaling requirements, and expected growth.
- Obtain approval from the responsible network owners before use.

If conflicts or sizing problems are found, revise this plan
before deploying or connecting networks.

## Open details

The remaining subnet layout, service-specific subnet sizes,
and detailed resource allocation remain to be designed.

All proposed subnet sizes require validation before implementation.
Address planning for the remaining application teams is outside
this initial pilot example and still needs to be completed.

## Security boundary

Separate address ranges do not enforce access restrictions.

The proposed controls in
[Network access rules](05-network-access.md)
remain applicable and require separate implementation and testing.

## Reference

[Microsoft: Plan for IP addressing](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/plan-for-ip-addressing)
