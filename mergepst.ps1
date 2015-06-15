# Merge mailbox and online archive into single PST
# Created by Chris Lord 25/03/2015

New-MailboxExportRequest -Mailbox user.name -FilePath "\\mgmt01\c$\users\chris.admin\Desktop\e-mail archives.pst"
New-MailboxExportRequest -Mailbox user.name -FilePath "\\mgmt01\c$\users\chris.admin\Desktop\e-mail archives.pst" -isArchive