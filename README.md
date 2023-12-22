# Fastascan

`fastascan` is a Bash script designed to produce a concise report about the `.fasta` or `.fa` files in a specified folder or its subfolders. The script provides insights into the content, number of sequences, sequence types (nucleotide or protein), and more.

## Features

- Scan `.fasta` or `.fa` files recursively in a directory.
- Identify and distinguish between nucleotide and protein sequences.
- Display a concise report including local and global statistics.
- Provide a single title example from one of the files.

## Prerequisites

- Bash shell environment.
- Basic Unix utilities (`grep`, `find`, `tput`).

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/fastascan.git
   cd fastascan/scripts


## Making fastascan Executable from Any Location

To make the fastascan script executable from any location in the terminal, you can add its directory to your system's PATH environment variable or move it to an existing directory in your PATH.

### Option 1: Add to an Existing Path Directory

    Locate a directory that's already in your PATH. Common directories include /usr/local/bin or ~/bin (for local user binaries).

    Move the fastascan.sh script to that directory:

    bash

mv /path/to/fastascan/scripts/fastascan.sh /usr/local/bin/fastascan

Make the script executable:

bash

    chmod +x /usr/local/bin/fastascan

Now, you can run fastascan from any location in the terminal.
Option 2: Create a New Path Directory

    Create a directory for custom binaries (if it doesn't already exist):

    bash

mkdir -p ~/bin

Move the fastascan.sh script to the new directory:

bash

mv /path/to/fastascan/scripts/fastascan.sh ~/bin/fastascan

Add the ~/bin directory to your PATH by appending the following line to your .bashrc or .bash_profile file (assuming you're using Bash):

bash

export PATH="$HOME/bin:$PATH"

Apply the changes by sourcing your profile:

bash

    source ~/.bashrc   # or source ~/.bash_profile

Now, you should be able to run fastascan from any location in the terminal.
Usage

Run the script without any arguments to scan the current directory:

bash

./fastascan.sh

Or specify a directory to scan:

bash

./fastascan.sh /path/to/directory

Sample Output

Upon execution, the script will generate a report detailing:

    File paths and symlink indications.
    Sequence types (Nucleotide/Protein).
    Number of sequences in each file.
    Total sequence length.
    A global summary across all scanned files.

Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
License

This project is licensed under the MIT License - see the LICENSE file for details.
