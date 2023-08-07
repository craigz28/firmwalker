#!/usr/bin/env python3

from argparse import ArgumentParser
from os import path
from pathlib import Path
from re import compile, match
from tqdm import tqdm
#from re import findall

from subprocess import run
from subprocess import Popen, PIPE 


def get_args():
    parser = ArgumentParser()
    parser.add_argument(
        "firmware_directory"
    )
    parser.add_argument(
        "-r",
        "--regex",
        help    = "Option to use \"data/regex\" - takes a long time",
        action  = "store_true",
        default = False
    )
    parser.add_argument(
        "-o",
        "--output",
        help    = "Optional name of the file to store results - defaults to " +\
               "\"firmwalker.txt\"",
        default = "firmwalker.txt"
    )
    return vars(parser.parse_args())


class Firmwalker():
    def __init__(self, firmware_directory, output_file, include_regex):
        if not path.isdir(firmware_directory):
            print("[!] Please choose a valid directory")
            exit(-1)
        self.directory   = firmware_directory
        self.output_file = output_file
        self.inc_regex   = include_regex
        self.filelisting = []
        self.dfd         = {}
        self.located     = {}
        self.separator   = "#"*79
        self.subline     = '-'*21

        self.output      = ""

        self.filelisting = self.get_full_file_listing(self.directory)
        self.get_data_files()
        self.iter_dfds()
        self.write_results()


    def get_full_file_listing(self, directory):
        directory = path.abspath(directory)
        listing = list(Path(directory).iterdir())

        returnable = []
        for item in listing:
            tmp_item = path.join(directory, item)
            if not item.is_dir():
                returnable.append(tmp_item)
            else:
                dir_items = self.get_full_file_listing(item)
                for di in dir_items:
                    returnable.append(path.join(directory, di))

        return returnable


    def get_data_files(self):
        tmp_dfd = self.get_full_file_listing("./data/")
        for f in tmp_dfd:
            with open(f, 'r') as fptr:
                tmp_content = fptr.read()
            self.dfd[f.split("/")[-1]] = tmp_content.splitlines()

        return


    def not_searching_patterns(self, d, tmp_filelisting):
        for st in self.dfd[d]:
            if st.startswith("*") or st.endswith("*"):
                if "." in st: st = st.replace(".", "\\.")
                if st.startswith("*"): st = f".{st}"
                if st.endswith("*")  : st = f"{st}."
                search_term = compile(st)
                for i in list(
                    filter(
                        search_term.match,
                        tmp_filelisting
                    )
                ):
                    if d not in self.located: self.located[d] = {}
                    self.located[d][st] = i

            else:
                if st in tmp_filelisting:
                    if d not in self.located: self.located[d] = {}
                    self.located[d][st] = self.filelisting[
                        tmp_filelisting.index(st)
                    ]
        return


    def searching_patterns(self, d, tmp_filelisting):
        for st in self.dfd[d]:
            op = f"\tSearching for: {st}\n"
            self.store_results(op)
            for i in tqdm(range(len(self.filelisting))):
                file = self.filelisting[i]
                st = str(st)
                with open(file, 'rb') as fptr:
                    content = fptr.read()
                if bytes(st, "utf-8") in content:
                    if d not in self.located: self.located[d] = {}
                    if st not in self.located[d]: self.located[d][st] = []
                    self.located[d][st].append(file)
        return


    def print_results(self, dfd):
        for found in self.located[dfd]:
            if type(self.located[dfd][found]) == str:
                op = f"Found: {self.located[dfd][found]}"
                self.store_results(op)
            else:
                tmp = ''
                for f in self.located[dfd][found]:
                    if tmp == found:
                        op = f
                    else:
                        tmp = found
                        op = f"{self.subline} {found} {self.subline}\n"
                        op += f
                    self.store_results(op)
        return

    def grep(self, d, tmp_filelisting):
        cmd = ["/bin/bash", f"./data/{d}", self.directory]
        process = Popen(cmd, stdout=PIPE, stderr=PIPE)
        out, err = process.communicate()
        out = out.decode("utf-8")
        self.store_results(out)


    def store_results(self, op):
        self.output += f"{op}\n"
        print(op)


    def iter_dfds(self):
        tmp_filelisting = [f.split('/')[-1] for f in self.filelisting]
        for d in self.dfd:
            op = f"[+] Searching {d}"
            self.store_results(op)
            if d != "patterns" and not d.endswith("_regex"):
                self.not_searching_patterns(d, tmp_filelisting)
            elif d == "patterns":
                self.searching_patterns(d, tmp_filelisting)
            elif d.endswith("_regex") and self.inc_regex:
                self.grep(d, tmp_filelisting)

            if d in self.located:
                self.print_results(d)
            self.store_results(self.separator)


    def write_results(self):
        if path.isfile(self.output_file):
            self.output_file = f"_{self.output_file}"
        with open(self.output_file, 'a') as fptr:
            fptr.write(self.output)

def main():
    args = get_args()
    firmwalker = Firmwalker(
        args["firmware_directory"],
        args["output"],
        args["regex"]
    )
    return


if __name__ == "__main__":
    exit(main())
