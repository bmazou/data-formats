.["@graph"] | .[] |
{
    name: (.name.cs // .name.en), 
    address: (.address.cs // .address.en),
    doctorCount: (.rooms | map(select(.doctor)) | length)
}
