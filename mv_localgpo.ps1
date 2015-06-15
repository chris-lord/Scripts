net use I: \\mgmt01-caz\software\MOUSR

cp I:\GroupPolicy\* C:\Windows\System32\GroupPolicy

cp I:\GroupPolicyUsers\* C:\Windows\System32\GroupPolicyUsers

gpupdate /force