# ADR 001: Hybrid connectivity for the pilot

Status: Provisional design decision for this fictional case study.

## Context

The employee portal requires controlled, encrypted connectivity
between Azure and the existing on-premises HR system.

Network capacity, available equipment, and existing connectivity
contracts have not yet been assessed.

## Decision

Plan a site-to-site VPN between the Azure hub network and the
on-premises network as the initial connectivity option for the pilot.

## Rationale

A VPN provides an encrypted connection over the public Internet.
It is an initial option to evaluate before committing to a new
ExpressRoute connection.

This choice does not yet demonstrate that the portal's performance
or availability requirements will be met.

## Alternative considered

ExpressRoute provides private connectivity outside the public Internet.
Encryption must be explicitly addressed.

An existing suitable ExpressRoute connection, stricter network
requirements, or unsuccessful VPN validation could change this decision.

## Conditions before implementation

- Confirm that organizational security policies permit this approach.
- Verify compatible VPN equipment and suitable Internet connectivity.
- Assess existing connections, costs, and contractual dependencies.
- Define routing, access controls, monitoring, and resilience measures.
- Plan end-to-end performance and recovery tests, including the HR system.

## Evidence status

No connection has been deployed or tested. Production approval
requires a separate review and documented validation results.

## References

- [Azure VPN Gateway](https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways)
- [ExpressRoute encryption](https://learn.microsoft.com/en-us/azure/expressroute/expressroute-about-encryption)
