# Requirements

Status: Draft

These are agreed planning targets for the fictional case study.
The acceptance criteria describe how a future implementation
would be validated.

## Pilot application requirements

| ID | Requirement | Acceptance criterion |
| --- | --- | --- |
| FR-01 | Signed-in employees can view their own department and business contact details from the existing on-premises HR system. | For a fictional test employee, the displayed information matches the corresponding HR records. |
| FR-02 | Employees sign in using their existing corporate account. | An authorised active test account can sign in. A blocked test account cannot complete a new sign-in. |
| SEC-01 | Employees can access only their own profile data. | Two test accounts can each access their own profile. Attempts to retrieve the other account's profile are denied, including through direct links or requests. |
| NFR-01 | The portal targets 99.5% availability during Monday–Friday, 08:00–18:00, measured monthly. | An availability report measures whether sign-in and profile display work during the agreed service hours. |
| NFR-02 | The portal supports 100 concurrently active employees signing in or viewing their profiles. | A load test simulates 100 active users completing the agreed user journeys. |
| NFR-03 | At least 95% of profile requests display complete data within three seconds at the agreed load of 100 active users. | Measure elapsed time from selecting "My profile" to the complete display of the data. Sign-in is already complete when measurement starts. |

## Availability calculation example

For a sample month with 20 working days:

- 20 days × 10 service hours = 200 service hours.
- A 99.5% availability target allows one hour of total unavailability.
- This allowance applies to all interruptions combined.

The actual monthly calculation uses the agreed service calendar.

## Details to confirm during discovery

- Business time zone and treatment of public holidays.
- Exact HR fields and integration interface.
- Load-test duration and the frequency of user actions.
- Whether the existing HR system and network connections can
  support the availability and response-time targets.

## Platform requirements

The following requirements apply to the shared Azure foundation.

| ID | Requirement | Acceptance criterion |
| --- | --- | --- |
| PLAT-01 | Development, test, and production environments must be independently manageable. Changes in development or test must not directly modify production resources. | A deployment using non-production permissions cannot modify production resources. |
| PLAT-02 | Application teams receive only the permissions needed for their responsibilities and assigned resources. Shared platform services are managed by designated authorised personnel. | Test accounts can perform their assigned tasks. Attempts to modify resources outside their authorised scope are denied. |
| PLAT-03 | Agreed operational and security events are collected centrally. Defined failures trigger notifications to the responsible team. | A simulated failure in a test environment is recorded and the notification reaches the designated team. |
| PLAT-04 | Standard development environments are provisioned through a repeatable, automated process, including agreed access controls, security settings, and monitoring, within one business day after approval. | Two test environments created through the same process receive the required settings. Provisioning time is measured from approval to readiness. |
| PLAT-05 | Each provisioned environment is associated with an application, responsible team, and environment type. Shared-service costs are reported separately and allocated using an agreed rule. | Required ownership information is present. A monthly cost report correctly attributes workload costs and explains shared-cost allocation. |
| PLAT-06 | The portal communicates with the on-premises HR system through a controlled connection using encryption in transit. The HR system must not be exposed publicly for this integration. | The approved data exchange succeeds, unauthorised connection attempts are blocked, and transport encryption and the absence of public exposure are verified. |
