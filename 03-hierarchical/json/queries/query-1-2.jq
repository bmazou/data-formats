.["@graph"] | .[] | .appointments[] | select(.time >= "2023-03-01") |
{
    time: .time,
    reason: (.reason.cs // .reason.en)
}