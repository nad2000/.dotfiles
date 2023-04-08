import os
import subprocess


def mailpasswd(acct):
    acct = os.path.basename(acct)
    # path = "/home/<username>/.passwd/%s.gpg" % acct
    path = os.path.join(os.path.expanduser("~"), ".passwd", "%s.gpg" % acct)
    args = ["gpg", "--use-agent", "--quiet", "--batch", "-d", path]
    try:
        return subprocess.check_output(args).strip()
    except subprocess.CalledProcessError:
        return ""


folder_map = {
    "drafts": "[Gmail]/Drafts",
    "chats": "[Gmail]/Chats",
    "flagged": "[Gmail]/Starred",
    "important": "[Gmail]/Important",
    "spam": "[Gmail]/Spam",
    "trash": "[Gmail]/Trash",
    "sent": "[Gmail]/Sent Mail",
    "archive": "[Gmail]/All Mail",
    "inbox": "INBOX",
}


def nametrans_local2gmail(folder):
    """Translate local folder names to the canonical Gmail labels."""
    return folder_map.get(
        folder,
        "[Gmail]/" + folder
        if folder in ["Drafts", "Starred", "Important", "Spam", "Trash", "All Mail", "Sent Mail", "Bin"]
        else folder,
    )


def nametrans_gmail2local(folder):
    """Translate gmail labels to local folder names"""
    for k, v in folder_map.items():
        if v in folder:
            return k
        if folder.startswith("[Gmail]"):
            return folder.replace("[Gmail]/", "")
        return folder
