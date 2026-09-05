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
