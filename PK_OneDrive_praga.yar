rule PK_OneDrive_praga : OneDrive
{
    meta:
        description = "Phishing Kit impersonating OneDrive"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2020-09-27"
        comment = "Phishing Kit - OneDrive - '&id=$praga$praga'"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "emailcode"
        // specific file found in PhishingKit
        $spec_file = "login-option.php"
        $spec_file2 = "email-2.php"
        $spec_file3 = "loading.php"
	    $spec_file4 = "Onedrive-logo.png"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        // check for file
        $spec_file and
        $spec_file2 and
        $spec_file3 and
        $spec_file4
}

