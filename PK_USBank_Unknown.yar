rule PK_USBank_Unknown : USBank
{
    meta:
        description = "Phishing Kit impersonating USBank"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2021-08-02"
        comment = "Phishing Kit - USBank - '-[ UnKnown ]-'"

    strings:
        // the zipfile working on
        $zip_file = { 50 4b 03 04 }
        // specific directory found in PhishingKit
        $spec_dir = "information_files"
        // specific file found in PhishingKit
        $spec_file = "gen_validatorv4.js.txt"
        $spec_file2 = "usbankDesktop.css"
        $spec_file3 = "information.htm"
        $spec_file4 = "log.php"

    condition:
        // look for the ZIP header
        uint32(0) == 0x04034b50 and
        // make sure we have a local file header
        $zip_file and
        $spec_dir and 
        // check for file
        all of ($spec_file*)
}