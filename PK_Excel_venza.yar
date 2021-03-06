rule PK_Excel_venza : Excel
{
    meta:
        description = "Phishing Kit impersonating Excel page"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2021-08-02"
        comment = "Phishing Kit - Excel - 'CrEaTeD bY VeNzA'"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "video"
        // specific file found in PhishingKit
        $spec_file = "next.php"
        $spec_file2 = "excel-white.png"
        $spec_file3 = "excel.mp4"
        $spec_file4 = "email.php"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        $spec_dir and 
        // check for file
        all of ($spec_file*)
}