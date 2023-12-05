.["@graph"] | .[] | select((.name.cs // .name.en) == "Zlata Nemocnice").rooms[] | select((.doctor.degree.cs // .doctor.degree.en) | index("MD")).doctor |
{
    fullName: ((.firstName.cs // .firstName.en) + " " + (.lastName.cs // .lastName.en)),
    degrees: (.degree.cs // .degree.en)
}