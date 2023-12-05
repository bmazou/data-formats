.["@graph"] | .[] | 
{
  time: .appointments[].time,
  reason: (.appointments[].reason.cs // .appointments[].reason.en),
  doctor: ((.appointments[].doctor.firstName.cs // .appointments[].doctor.firstName.en) + " " + (.appointments[].doctor.lastName.cs // .appointments[].doctor.lastName.en)),
  patient: ((.firstName.cs // .firstName.en) + " " + (.lastName.cs // .lastName.en))
}