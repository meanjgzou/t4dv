rule PK_Facebook_checks : Facebook
{
    meta:
        description = "Phishing Kit impersonating Facebook"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2021-09-17"
        comment = "Phishing Kit - Facebook - 'Facebook - emailchecks.io'"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "handlers"
        // specific file found in PhishingKit
        $spec_file = "process.php"
        $spec_file2 = "bt.php"
        $spec_file3 = "email.php"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        $spec_dir and 
        // check for file
        all of ($spec_file*)
}

