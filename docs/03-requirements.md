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
