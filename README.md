# Enterprise Azure Landing Zone

A Solution Architecture case study exploring the design, governance, migration, and operation of an enterprise Azure platform.

**Author.** Amira Hegazy
**Status.** In progress

## Business scenario

This case study describes a fictional mid-sized European enterprise with five application teams operating across on-premises infrastructure and independently managed Azure subscriptions.

Cloud environments are provisioned manually, security controls vary between teams, and application costs are difficult to track. The company's infrastructure-provider contract expires in 12 months, creating a deadline to evaluate migration and future service ownership.

The company wants a standardized Azure Landing Zone supporting development, test, and production environments. An internal employee service portal will serve as the pilot application, with continued connectivity to an on-premises HR system.

The intended outcomes are faster environment provisioning, consistent security and governance, clearer cost ownership, and a controlled migration and operational handover.

All organizational details and timelines are fictional assumptions for this architecture study.


## Business objectives

The following are proposed targets for this fictional case study.

1. **Faster provisioning:** Provide a standard development environment within one business day after request approval, including the agreed security and monitoring settings.

2. **Consistent security:** Every new environment must pass the agreed security checks before use. The results must be documented.

3. **Cost transparency:** Produce a monthly report that assigns Azure costs to applications and responsible teams. Show shared-service costs separately and allocate them using an agreed rule.

4. **Controlled migration and handover:** Migrate the employee portal according to an agreed plan. Complete functional and operational acceptance tests and obtain documented approval from the business and operations owners.


## Project documentation

- [Stakeholders and responsibilities](docs/01-stakeholders.md)
- [Project scope](docs/02-scope.md)
- [Requirements](docs/03-requirements.md)
- [Target architecture](docs/04-target-architecture.md)
- [ADR 001: Hybrid connectivity](docs/decisions/001-hybrid-connectivity.md)
- [Network access rules](docs/05-network-access.md)
- [IP address plan](docs/06-ip-address-plan.md)

## Terraform example and continuous integration

The [hub Terraform example](infra/terraform/hub) defines a resource group,
a hub virtual network, and a GatewaySubnet.

This is a small infrastructure-code example, not a complete landing-zone
deployment. Address ranges remain provisional and require validation
before deployment.

The [Terraform checks workflow](.github/workflows/terraform-checks.yml)
runs automatically on pushes to master and pull requests targeting master.
It can also be started manually.

The workflow performs these steps:

- Checks formatting with `terraform fmt -check -diff`.
- Downloads the required provider using
  `terraform init -backend=false -input=false`, without initializing a backend.
- Checks configuration validity with `terraform validate -no-color`.
- Makes the provider lockfile available as a downloadable artifact for seven days.

The [committed lockfile](infra/terraform/hub/.terraform.lock.hcl)
records the selected provider version and package checksums.

On 8 September 2026, CI run #3 passed for commit `e2cbaed`.
Its initialization log confirmed reuse of AzureRM version `4.81.0`
from the committed lockfile.

No Azure resources have been deployed in this case study.
The workflow does not log in to Azure or run Terraform plan or apply.
Passing these checks does not prove successful deployment,
network connectivity, security enforcement, or HR integration.
